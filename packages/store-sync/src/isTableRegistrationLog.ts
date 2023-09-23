import { StorageAdapterLog, schemasTableId } from "./common";

export function isTableRegistrationLog(
  log: StorageAdapterLog
): log is StorageAdapterLog & { eventName: "Store_SetRecord" } {
  return log.eventName === "Store_SetRecord" && log.args.tableId === schemasTableId;
}
