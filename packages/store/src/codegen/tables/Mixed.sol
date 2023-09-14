// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "../../IStore.sol";
import { StoreSwitch } from "../../StoreSwitch.sol";
import { StoreCore } from "../../StoreCore.sol";
import { Bytes } from "../../Bytes.sol";
import { Memory } from "../../Memory.sol";
import { SliceLib } from "../../Slice.sol";
import { EncodeArray } from "../../tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "../../FieldLayout.sol";
import { Schema, SchemaLib } from "../../Schema.sol";
import { PackedCounter, PackedCounterLib } from "../../PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16("mudstore"), bytes16("Mixed")));
bytes32 constant MixedTableId = _tableId;

struct MixedData {
  uint32 u32;
  uint128 u128;
  uint32[] a32;
  string s;
}

library Mixed {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    uint256[] memory _fieldLayout = new uint256[](2);
    _fieldLayout[0] = 4;
    _fieldLayout[1] = 16;

    return FieldLayoutLib.encode(_fieldLayout, 2);
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](4);
    _schema[0] = SchemaType.UINT32;
    _schema[1] = SchemaType.UINT128;
    _schema[2] = SchemaType.UINT32_ARRAY;
    _schema[3] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "key";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](4);
    fieldNames[0] = "u32";
    fieldNames[1] = "u128";
    fieldNames[2] = "a32";
    fieldNames[3] = "s";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(
      _tableId,
      getFieldLayout(),
      getKeySchema(),
      getValueSchema(),
      false,
      getKeyNames(),
      getFieldNames()
    );
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(
      _tableId,
      getFieldLayout(),
      getKeySchema(),
      getValueSchema(),
      false,
      getKeyNames(),
      getFieldNames()
    );
  }

  /** Get u32 */
  function getU32(bytes32 key) internal view returns (uint32 u32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Get u32 (using the specified store) */
  function getU32(IStore _store, bytes32 key) internal view returns (uint32 u32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getFieldLayout());
    return (uint32(Bytes.slice4(_blob, 0)));
  }

  /** Set u32 */
  function setU32(bytes32 key, uint32 u32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((u32)), getFieldLayout());
  }

  /** Set u32 (using the specified store) */
  function setU32(IStore _store, bytes32 key, uint32 u32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((u32)), getFieldLayout());
  }

  /** Get u128 */
  function getU128(bytes32 key) internal view returns (uint128 u128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getFieldLayout());
    return (uint128(Bytes.slice16(_blob, 0)));
  }

  /** Get u128 (using the specified store) */
  function getU128(IStore _store, bytes32 key) internal view returns (uint128 u128) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getFieldLayout());
    return (uint128(Bytes.slice16(_blob, 0)));
  }

  /** Set u128 */
  function setU128(bytes32 key, uint128 u128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((u128)), getFieldLayout());
  }

  /** Set u128 (using the specified store) */
  function setU128(IStore _store, bytes32 key, uint128 u128) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((u128)), getFieldLayout());
  }

  /** Get a32 */
  function getA32(bytes32 key) internal view returns (uint32[] memory a32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2, getFieldLayout());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /** Get a32 (using the specified store) */
  function getA32(IStore _store, bytes32 key) internal view returns (uint32[] memory a32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2, getFieldLayout());
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /** Set a32 */
  function setA32(bytes32 key, uint32[] memory a32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 2, EncodeArray.encode((a32)), getFieldLayout());
  }

  /** Set a32 (using the specified store) */
  function setA32(IStore _store, bytes32 key, uint32[] memory a32) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 2, EncodeArray.encode((a32)), getFieldLayout());
  }

  /** Get the length of a32 */
  function lengthA32(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 2, getFieldLayout());
    unchecked {
      return _byteLength / 4;
    }
  }

  /** Get the length of a32 (using the specified store) */
  function lengthA32(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 2, getFieldLayout());
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * Get an item of a32
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemA32(bytes32 key, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        2,
        getFieldLayout(),
        _index * 4,
        (_index + 1) * 4
      );
      return (uint32(Bytes.slice4(_blob, 0)));
    }
  }

  /**
   * Get an item of a32 (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemA32(IStore _store, bytes32 key, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 2, getFieldLayout(), _index * 4, (_index + 1) * 4);
      return (uint32(Bytes.slice4(_blob, 0)));
    }
  }

  /** Push an element to a32 */
  function pushA32(bytes32 key, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Push an element to a32 (using the specified store) */
  function pushA32(IStore _store, bytes32 key, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 2, abi.encodePacked((_element)), getFieldLayout());
  }

  /** Pop an element from a32 */
  function popA32(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 2, 4, getFieldLayout());
  }

  /** Pop an element from a32 (using the specified store) */
  function popA32(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 2, 4, getFieldLayout());
  }

  /**
   * Update an element of a32 at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateA32(bytes32 key, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 2, _index * 4, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /**
   * Update an element of a32 (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateA32(IStore _store, bytes32 key, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 2, _index * 4, abi.encodePacked((_element)), getFieldLayout());
    }
  }

  /** Get s */
  function getS(bytes32 key) internal view returns (string memory s) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3, getFieldLayout());
    return (string(_blob));
  }

  /** Get s (using the specified store) */
  function getS(IStore _store, bytes32 key) internal view returns (string memory s) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3, getFieldLayout());
    return (string(_blob));
  }

  /** Set s */
  function setS(bytes32 key, string memory s) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setField(_tableId, _keyTuple, 3, bytes((s)), getFieldLayout());
  }

  /** Set s (using the specified store) */
  function setS(IStore _store, bytes32 key, string memory s) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setField(_tableId, _keyTuple, 3, bytes((s)), getFieldLayout());
  }

  /** Get the length of s */
  function lengthS(bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 3, getFieldLayout());
    unchecked {
      return _byteLength / 1;
    }
  }

  /** Get the length of s (using the specified store) */
  function lengthS(IStore _store, bytes32 key) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 3, getFieldLayout());
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * Get an item of s
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemS(bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = StoreSwitch.getFieldSlice(
        _tableId,
        _keyTuple,
        3,
        getFieldLayout(),
        _index * 1,
        (_index + 1) * 1
      );
      return (string(_blob));
    }
  }

  /**
   * Get an item of s (using the specified store)
   * (unchecked, returns invalid data if index overflows)
   */
  function getItemS(IStore _store, bytes32 key, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 3, getFieldLayout(), _index * 1, (_index + 1) * 1);
      return (string(_blob));
    }
  }

  /** Push a slice to s */
  function pushS(bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.pushToField(_tableId, _keyTuple, 3, bytes((_slice)), getFieldLayout());
  }

  /** Push a slice to s (using the specified store) */
  function pushS(IStore _store, bytes32 key, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.pushToField(_tableId, _keyTuple, 3, bytes((_slice)), getFieldLayout());
  }

  /** Pop a slice from s */
  function popS(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.popFromField(_tableId, _keyTuple, 3, 1, getFieldLayout());
  }

  /** Pop a slice from s (using the specified store) */
  function popS(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.popFromField(_tableId, _keyTuple, 3, 1, getFieldLayout());
  }

  /**
   * Update a slice of s at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateS(bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      StoreSwitch.updateInField(_tableId, _keyTuple, 3, _index * 1, bytes((_slice)), getFieldLayout());
    }
  }

  /**
   * Update a slice of s (using the specified store) at `_index`
   * (checked only to prevent modifying other tables; can corrupt own data if index overflows)
   */
  function updateS(IStore _store, bytes32 key, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    unchecked {
      _store.updateInField(_tableId, _keyTuple, 3, _index * 1, bytes((_slice)), getFieldLayout());
    }
  }

  /** Get the full data */
  function get(bytes32 key) internal view returns (MixedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, bytes32 key) internal view returns (MixedData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getFieldLayout());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(bytes32 key, uint32 u32, uint128 u128, uint32[] memory a32, string memory s) internal {
    bytes memory _data = encode(u32, u128, a32, s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, bytes32 key, uint32 u32, uint128 u128, uint32[] memory a32, string memory s) internal {
    bytes memory _data = encode(u32, u128, a32, s);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.setRecord(_tableId, _keyTuple, _data, getFieldLayout());
  }

  /** Set the full data using the data struct */
  function set(bytes32 key, MixedData memory _table) internal {
    set(key, _table.u32, _table.u128, _table.a32, _table.s);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, bytes32 key, MixedData memory _table) internal {
    set(_store, key, _table.u32, _table.u128, _table.a32, _table.s);
  }

  /**
   * Decode the tightly packed blob using this table's field layout.
   * Undefined behaviour for invalid blobs.
   */
  function decode(bytes memory _blob) internal pure returns (MixedData memory _table) {
    // 20 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 20));

    _table.u32 = (uint32(Bytes.slice4(_blob, 0)));

    _table.u128 = (uint128(Bytes.slice16(_blob, 4)));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 20) {
      // skip static data length + dynamic lengths word
      uint256 _start = 52;
      uint256 _end;
      unchecked {
        _end = 52 + _encodedLengths.atIndex(0);
      }
      _table.a32 = (SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint32());

      _start = _end;
      unchecked {
        _end += _encodedLengths.atIndex(1);
      }
      _table.s = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's field layout */
  function encode(uint32 u32, uint128 u128, uint32[] memory a32, string memory s) internal pure returns (bytes memory) {
    PackedCounter _encodedLengths;
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(a32.length * 4, bytes(s).length);
    }

    return abi.encodePacked(u32, u128, _encodedLengths.unwrap(), EncodeArray.encode((a32)), bytes((s)));
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 key) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 key) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = key;

    _store.deleteRecord(_tableId, _keyTuple, getFieldLayout());
  }
}
