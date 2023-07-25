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

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("Dynamics2")));
bytes32 constant Dynamics2TableId = _tableId;

struct Dynamics2Data {
  uint64[] u64;
  string str;
  bytes b;
}

library Dynamics2 {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](3);
    _schema[0] = SchemaType.UINT64_ARRAY;
    _schema[1] = SchemaType.STRING;
    _schema[2] = SchemaType.BYTES;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](3);
    _fieldNames[0] = "u64";
    _fieldNames[1] = "str";
    _fieldNames[2] = "b";
    return ("Dynamics2", _fieldNames);
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

  /** Get u64 */
  function getU64(bytes32 key) internal view returns (uint64[] memory u64) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint64());
  }

  /** Get u64 (using the specified store) */
  function getU64(IStore _store, bytes32 key) internal view returns (uint64[] memory u64) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint64());
  }

  /** Set u64 */
  function setU64(bytes32 key, uint64[] memory u64) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 0, EncodeArray.encode((u64)));
  }

  /** Set u64 (using the specified store) */
  function setU64(IStore _store, bytes32 key, uint64[] memory u64) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 0, EncodeArray.encode((u64)));
  }

  /** Get the length of u64 */
  function lengthU64(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 8;
  }

  /** Get the length of u64 (using the specified store) */
  function lengthU64(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 8;
  }

  /** Get an item of u64 (unchecked, returns invalid data if index overflows) */
  function getItemU64(bytes32 key, uint256 _index) internal view returns (uint64) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 8, (_index + 1) * 8);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Get an item of u64 (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemU64(IStore _store, bytes32 key, uint256 _index) internal view returns (uint64) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 8, (_index + 1) * 8);
    return (uint64(Bytes.slice8(_blob, 0)));
  }

  /** Push an element to u64 */
  function pushU64(bytes32 key, uint64 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Push an element to u64 (using the specified store) */
  function pushU64(IStore _store, bytes32 key, uint64 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /** Pop an element from u64 */
  function popU64(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 8);
  }

  /** Pop an element from u64 (using the specified store) */
  function popU64(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 0, 8);
  }

  /** Update an element of u64 at `_index` */
  function updateU64(bytes32 key, uint256 _index, uint64 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 8, abi.encodePacked((_element)));
  }

  /** Update an element of u64 (using the specified store) at `_index` */
  function updateU64(IStore _store, bytes32 key, uint256 _index, uint64 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.updateInField(_tableId, _keyTuple, 0, _index * 8, abi.encodePacked((_element)));
  }

  /** Get str */
  function getStr(bytes32 key) internal view returns (string memory str) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /** Get str (using the specified store) */
  function getStr(IStore _store, bytes32 key) internal view returns (string memory str) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /** Set str */
  function setStr(bytes32 key, string memory str) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 1, bytes((str)));
  }

  /** Set str (using the specified store) */
  function setStr(IStore _store, bytes32 key, string memory str) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 1, bytes((str)));
  }

  /** Get the length of str */
  function lengthStr(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of str (using the specified store) */
  function lengthStr(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of str (unchecked, returns invalid data if index overflows) */
  function getItemStr(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of str (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemStr(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to str */
  function pushStr(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /** Push a slice to str (using the specified store) */
  function pushStr(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /** Pop a slice from str */
  function popStr(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 1);
  }

  /** Pop a slice from str (using the specified store) */
  function popStr(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 1, 1);
  }

  /** Update a slice of str at `_index` */
  function updateStr(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)));
  }

  /** Update a slice of str (using the specified store) at `_index` */
  function updateStr(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)));
  }

  /** Get b */
  function getB(bytes32 key) internal view returns (bytes memory b) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2);
    return (bytes(_blob));
  }

  /** Get b (using the specified store) */
  function getB(IStore _store, bytes32 key) internal view returns (bytes memory b) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2);
    return (bytes(_blob));
  }

  /** Set b */
  function setB(bytes32 key, bytes memory b) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 2, bytes((b)));
  }

  /** Set b (using the specified store) */
  function setB(IStore _store, bytes32 key, bytes memory b) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 2, bytes((b)));
  }

  /** Get the length of b */
  function lengthB(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of b (using the specified store) */
  function lengthB(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of b (unchecked, returns invalid data if index overflows) */
  function getItemB(bytes32 key, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 1, (_index + 1) * 1);
    return (bytes(_blob));
  }

  /** Get an item of b (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemB(IStore _store, bytes32 key, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getSchema(), _index * 1, (_index + 1) * 1);
    return (bytes(_blob));
  }

  /** Push a slice to b */
  function pushB(bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /** Push a slice to b (using the specified store) */
  function pushB(IStore _store, bytes32 key, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 2, bytes((_slice)));
  }

  /** Pop a slice from b */
  function popB(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 1);
  }

  /** Pop a slice from b (using the specified store) */
  function popB(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 2, 1);
  }

  /** Update a slice of b at `_index` */
  function updateB(bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)));
  }

  /** Update a slice of b (using the specified store) at `_index` */
  function updateB(IStore _store, bytes32 key, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.updateInField(_tableId, _keyTuple, 2, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (Dynamics2Data memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (Dynamics2Data memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 key, uint64[] memory u64, string memory str, bytes memory b) internal {
    bytes memory _data = encode(u64, str, b);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 key, uint64[] memory u64, string memory str, bytes memory b) internal {
    bytes memory _data = encode(u64, str, b);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, Dynamics2Data memory _table) internal {
    set(key, _table.u64, _table.str, _table.b);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, Dynamics2Data memory _table) internal {
    set(_store, key, _table.u64, _table.str, _table.b);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (Dynamics2Data memory _table) {
    // 0 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 0));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 0) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 32;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.u64 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint64());

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.str = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(2);
      _table.b = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(uint64[] memory u64, string memory str, bytes memory b) internal pure returns (bytes memory) {
    uint40[] memory _counters = new uint40[](3);
    _counters[0] = uint40(u64.length * 8);
    _counters[1] = uint40(bytes(str).length);
    _counters[2] = uint40(bytes(b).length);
    bytes32 _encodedLengths = PackedCounterLib.pack(_counters).unwrap();

    uint256 _resultLength;
    unchecked {
      _resultLength = 32 + _counters[0] + _counters[1] + _counters[2];
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
    EncodeArray.encodeToLocation((u64), _resultPointer);
    unchecked {
      _resultPointer += _counters[0];
    }
    Memory.copy(Memory.dataPointer(bytes((str))), _resultPointer, _counters[1]);
    unchecked {
      _resultPointer += _counters[1];
    }
    Memory.copy(Memory.dataPointer(bytes((b))), _resultPointer, _counters[2]);
    return _result;
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
