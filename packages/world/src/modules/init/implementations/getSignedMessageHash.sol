// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

string constant name = "App Name";
string constant version = "1";
address constant verifyingContract = 0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC;

bytes32 constant DELEGATION_TYPEHASH = keccak256(
  "Delegation(address delegatee,bytes32 delegationControlId,bytes initCallData,uint256 nonce)"
);

function getSignedMessageHash(
  address delegatee,
  ResourceId delegationControlId,
  bytes memory initCallData,
  uint256 nonce
) view returns (bytes32) {
  bytes32 domainSeperator = keccak256(
    abi.encode(
      keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"),
      keccak256(bytes(name)),
      keccak256(bytes(version)),
      block.chainid,
      verifyingContract
    )
  );

  return
    keccak256(
      abi.encodePacked(
        "\x19\x01",
        domainSeperator,
        keccak256(abi.encode(DELEGATION_TYPEHASH, delegatee, delegationControlId, keccak256(initCallData), nonce))
      )
    );
}
