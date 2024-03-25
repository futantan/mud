import { afterEach, beforeEach, describe, expect, it } from "vitest";
import type { ViteDevServer } from "vite";
import { Browser, Page } from "@playwright/test";
import { createAsyncErrorHandler } from "./asyncErrors";
import { deployContracts, startViteServer, startBrowserAndPage, openClientWithRootAccount } from "./setup";
import { rpcHttpUrl } from "./setup/constants";
import { waitForInitialSync } from "./data/waitForInitialSync";
import { createBurnerAccount, resourceToHex, transportObserver } from "@latticexyz/common";
import { http, createWalletClient, ClientConfig } from "viem";
import { mudFoundry } from "@latticexyz/common/chains";
import { encodeEntity } from "@latticexyz/store-sync/recs";
import { callPageFunction } from "./data/callPageFunction";
import worldConfig from "@latticexyz/world/mud.config";
import { worldToV1 } from "@latticexyz/world/config/v2";
import { types } from "@latticexyz/world/internal";
import { getWorld } from "./data/getWorld";
import { callRegisterDelegationWithSignature } from "./data/callRegisterDelegationWithSignature";

const PRIVATE_KEY = "0x67bbd1575ecc79b3247c7d7b87a5bc533ccb6a63955a9fefdfaf75853f7cd543";

const worldConfigV1 = worldToV1(worldConfig);

describe("registerDelegationWithSignature", async () => {
  const asyncErrorHandler = createAsyncErrorHandler();
  let webserver: ViteDevServer;
  let browser: Browser;
  let page: Page;

  beforeEach(async () => {
    asyncErrorHandler.resetErrors();

    await deployContracts(rpcHttpUrl);

    // Start client and browser
    webserver = await startViteServer();
    const browserAndPage = await startBrowserAndPage(asyncErrorHandler.reportError);
    browser = browserAndPage.browser;
    page = browserAndPage.page;
  });

  afterEach(async () => {
    await browser.close();
    await webserver.close();
  });

  it("can generate a signature and register a delegation", async () => {
    await openClientWithRootAccount(page);
    await waitForInitialSync(page);

    // Set up client
    const clientOptions = {
      chain: mudFoundry,
      transport: transportObserver(http(mudFoundry.rpcUrls.default.http[0] ?? undefined)),
    } as const satisfies ClientConfig;

    const account = createBurnerAccount(PRIVATE_KEY);
    const walletClient = createWalletClient({
      ...clientOptions,
      account,
    });

    const worldContract = await getWorld(page);

    // Sign registration message
    const delegatee = "0x7203e7ADfDF38519e1ff4f8Da7DCdC969371f377";
    const delegationControlId = resourceToHex({ type: "system", namespace: "", name: "unlimited" });
    const initCallData = "0x";
    const nonce = 0n;

    const signature = await walletClient.signTypedData({
      domain: {
        chainId: walletClient.chain.id,
        verifyingContract: worldContract.address,
      },
      types,
      primaryType: "Delegation",
      message: {
        delegatee,
        delegationControlId,
        initCallData,
        nonce,
      },
    });

    // Register the delegation
    await callRegisterDelegationWithSignature(page, [
      delegatee,
      delegationControlId,
      initCallData,
      walletClient.account.address,
      signature,
    ]);

    // Expect delegation to have been created
    const value = await callPageFunction(page, "getComponentValue", [
      "UserDelegationControl",
      encodeEntity(worldConfigV1.tables.UserDelegationControl.keySchema, {
        delegator: account.address,
        delegatee,
      }),
    ]);

    expect(value).toMatchInlineSnapshot(`
        {
          "__staticData": "0x73790000000000000000000000000000756e6c696d6974656400000000000000",
          "delegationControlId": "0x73790000000000000000000000000000756e6c696d6974656400000000000000",
        }
      `);
  });
});
