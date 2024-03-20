import { Store as StoreConfig } from "@latticexyz/store/config/v2";
import { SyncOptions, SyncResult, storeTables, worldTables } from "../common";
import { createStoreSync } from "../createStoreSync";
import { ZustandStore } from "./createStore";
import { createStore } from "./createStore";
import { createStorageAdapter } from "./createStorageAdapter";
import { Address } from "viem";
import { SyncStep } from "../SyncStep";
import { Tables } from "./common";

type AllTables<config extends StoreConfig, extraTables extends Tables | undefined> = config["tables"] &
  (extraTables extends Tables ? extraTables : {}) &
  typeof storeTables &
  typeof worldTables;

type SyncToZustandOptions<config extends StoreConfig, extraTables extends Tables | undefined> = Omit<
  SyncOptions,
  "config"
> & {
  // require address for now to keep the data model + retrieval simpler
  address: Address;
  config: config;
  tables?: extraTables;
  store?: ZustandStore<AllTables<config, extraTables>>;
  startSync?: boolean;
};

type SyncToZustandResult<config extends StoreConfig, extraTables extends Tables | undefined> = SyncResult & {
  tables: AllTables<config, extraTables>;
  useStore: ZustandStore<AllTables<config, extraTables>>;
  stopSync: () => void;
};

export async function syncToZustand<config extends StoreConfig, extraTables extends Tables | undefined>({
  config,
  tables: extraTables,
  store,
  startSync = true,
  ...syncOptions
}: SyncToZustandOptions<config, extraTables>): Promise<SyncToZustandResult<config, extraTables>> {
  // TODO: move store/world tables into config
  const tables = {
    ...config.tables,
    ...extraTables,
    ...storeTables,
    ...worldTables,
  } as unknown as AllTables<config, extraTables>;

  const useStore = store ?? createStore({ tables });
  const storageAdapter = createStorageAdapter({ store: useStore });

  const storeSync = await createStoreSync({
    storageAdapter,
    ...syncOptions,
    onProgress: (syncProgress) => {
      // already live, no need for more progress updates
      if (useStore.getState().syncProgress.step === SyncStep.LIVE) return;
      useStore.setState(() => ({ syncProgress }));
    },
  });

  const sub = startSync ? storeSync.storedBlockLogs$.subscribe() : null;
  const stopSync = (): void => {
    sub?.unsubscribe();
  };

  return {
    ...storeSync,
    tables,
    useStore,
    stopSync,
  };
}
