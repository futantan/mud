import { Sql } from "postgres";
import { Middleware } from "koa";
import Router from "@koa/router";
import compose from "koa-compose";
import { input } from "@latticexyz/store-sync/indexer-client";
import { storeTables } from "@latticexyz/store-sync";
import { queryLogs } from "./queryLogs";
import { recordToLog } from "./recordToLog";
import { debug, error } from "../debug";
import { createBenchmark } from "@latticexyz/common";
import { compress } from "../compress";

export function apiRoutes(database: Sql): Middleware {
  const router = new Router();

  router.get("/api/logs", compress(), async (ctx) => {
    const benchmark = createBenchmark("postgres:logs");
    let options: ReturnType<typeof input.parse>;

    try {
      options = input.parse(typeof ctx.query.input === "string" ? JSON.parse(ctx.query.input) : {});
    } catch (e) {
      ctx.status = 400;
      ctx.body = JSON.stringify(e);
      debug(e);
      return;
    }

    try {
      options.filters = options.filters.length > 0 ? [...options.filters, { tableId: storeTables.Tables.tableId }] : [];
      const records = await queryLogs(database, options ?? {}).execute();
      benchmark("query records");
      const logs = records.map(recordToLog);
      benchmark("map records to logs");

      if (records.length === 0) {
        ctx.status = 404;
        ctx.body = "no logs found";
        error(
          `no logs found for chainId ${options.chainId}, address ${options.address}, filters ${JSON.stringify(
            options.filters
          )}`
        );
        return;
      }

      const blockNumber = records[0].chainBlockNumber;
      ctx.body = JSON.stringify({ blockNumber, logs });
      ctx.status = 200;

      // client fetches logs 1000 blocks at a time, so we'll allow clients to get behind by 4 rpc requests worth
      // this equates to ~2 hours, which seems like a reasonable refresh rate for an effective cache!
      // we've also turned on `stale-while-revalidate`, which will refetch in the background once stale so responses are always snappy
      const maxAgeInBlocks = 1000 * 4;
      const secondsPerBlock = 2;
      ctx.set("Cache-Control", `s-maxage=${maxAgeInBlocks * secondsPerBlock}, stale-while-revalidate`);
    } catch (e) {
      ctx.status = 500;
      ctx.body = JSON.stringify(e);
      error(e);
    }
  });

  return compose([router.routes(), router.allowedMethods()]) as Middleware;
}
