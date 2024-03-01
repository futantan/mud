// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { IStore } from "@latticexyz/store/src/IStore.sol";
import { IWorldKernel } from "../../IWorldKernel.sol";

import { IAccessManagementSystem } from "./IAccessManagementSystem.sol";
import { IBalanceTransferSystem } from "./IBalanceTransferSystem.sol";
import { IBatchCallSystem } from "./IBatchCallSystem.sol";
import { IModuleInstallationSystem } from "./IModuleInstallationSystem.sol";
import { IWorldRegistrationSystem } from "./IWorldRegistrationSystem.sol";
import { IRegistrationSystem } from "./IRegistrationSystem.sol";

/**
 * @title IBaseWorld
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @notice This interface integrates all systems and associated function selectors
 * that are dynamically registered in the World during deployment.
 * @dev This is an autogenerated file; do not edit manually.
 */
interface IBaseWorld is
  IStore,
  IWorldKernel,
  IAccessManagementSystem,
  IBalanceTransferSystem,
  IBatchCallSystem,
  IModuleInstallationSystem,
  IWorldRegistrationSystem,
  IRegistrationSystem
{}
