// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("SystemHooks")));
bytes32 constant SystemHooksTableId = _tableId;

library SystemHooks {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.ADDRESS_ARRAY;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](1);
    _fieldNames[0] = "value";
    return ("SystemHooks", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get value */
  function get(bytes32 resourceSelector) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Get value (using the specified store) */
  function get(IStore _store, bytes32 resourceSelector) internal view returns (address[] memory value) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_address());
  }

  /** Set value */
  function set(bytes32 resourceSelector, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)));
  }

  /** Set value (using the specified store) */
  function set(IStore _store, bytes32 resourceSelector, address[] memory value) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((value)));
  }

  /** Get the length of value */
  function length(bytes32 resourceSelector) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 20;
  }

  /** Get the length of value (using the specified store) */
  function length(IStore _store, bytes32 resourceSelector) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 20;
  }

  /** Get an item of value (unchecked, returns invalid data if index overflows) */
  function getItem(bytes32 resourceSelector, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 20, (_index + 1) * 20);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Get an item of value (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItem(IStore _store, bytes32 resourceSelector, uint256 _index) internal view returns (address) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 20, (_index + 1) * 20);
    return (address(Bytes.slice20(_blob, 0)));
  }

  /** Push an element to value */
  function push(bytes32 resourceSelector, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Push an element to value (using the specified store) */
  function push(IStore _store, bytes32 resourceSelector, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Pop an element from value */
  function pop(bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 20);
  }

  /** Pop an element from value (using the specified store) */
  function pop(IStore _store, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.popFromField(_tableId, _keyTuple, 0, 20);
  }

  /** Update an element of value at `_index` */
  function update(bytes32 resourceSelector, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)));
  }

  /** Update an element of value (using the specified store) at `_index` */
  function update(IStore _store, bytes32 resourceSelector, uint256 _index, address _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.updateInField(_tableId, _keyTuple, 0, _index * 20, abi.encodePacked((_element)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(address[] memory value) internal pure returns (bytes memory) {
    uint40[] memory _counters = new uint40[](1);
    _counters[0] = uint40(value.length * 20);
    bytes32 _encodedLengths = PackedCounterLib.pack(_counters).unwrap();

    uint256 _resultLength;
    unchecked {
      _resultLength = 32 + _counters[0];
    }

    bytes memory _result;
    uint256 _resultPointer;

    /// @solidity memory-safe-assembly
    assembly {
      // allocate memory
      _result := mload(0x40)
      _resultPointer := add(_result, 0x20)
      mstore(0x40, add(_resultPointer, and(add(_resultLength, 31), not(31))))
      mstore(_result, _resultLength)

      mstore(add(_resultPointer, 0), shl(0, _encodedLengths))

      _resultPointer := add(_resultPointer, 32)
    }
    EncodeArray.encodeToLocation((value), _resultPointer);
    return _result;
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 resourceSelector) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 resourceSelector) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = resourceSelector;

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
