// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "../../IStore.sol";
import { StoreSwitch } from "../../StoreSwitch.sol";
import { StoreCore } from "../../StoreCore.sol";
import { Bytes } from "../../Bytes.sol";
import { Memory } from "../../Memory.sol";
import { SliceLib } from "../../Slice.sol";
import { EncodeArray } from "../../tightcoder/EncodeArray.sol";
import { FieldLayout } from "../../FieldLayout.sol";
import { Schema } from "../../Schema.sol";
import { EncodedLengths, EncodedLengthsLib } from "../../EncodedLengths.sol";
import { ResourceId } from "../../ResourceId.sol";

// Import user types
import { ResourceId } from "./../../ResourceId.sol";
import { FieldLayout } from "./../../FieldLayout.sol";
import { Schema } from "./../../Schema.sol";

struct TablesData {
  FieldLayout fieldLayout;
  Schema keySchema;
  Schema valueSchema;
  bytes abiEncodedKeyNames;
  bytes abiEncodedFieldNames;
}

library Tables {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "store", name: "Tables", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746273746f72650000000000000000005461626c657300000000000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0060030220202000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (bytes32)
  Schema constant _keySchema = Schema.wrap(0x002001005f000000000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (bytes32, bytes32, bytes32, bytes, bytes)
  Schema constant _valueSchema = Schema.wrap(0x006003025f5f5fc4c40000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "tableId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](5);
    fieldNames[0] = "fieldLayout";
    fieldNames[1] = "keySchema";
    fieldNames[2] = "valueSchema";
    fieldNames[3] = "abiEncodedKeyNames";
    fieldNames[4] = "abiEncodedFieldNames";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get fieldLayout.
   */
  function getFieldLayout(ResourceId tableId) internal view returns (FieldLayout fieldLayout) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return FieldLayout.wrap(bytes32(_blob));
  }

  /**
   * @notice Get fieldLayout.
   */
  function _getFieldLayout(ResourceId tableId) internal view returns (FieldLayout fieldLayout) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return FieldLayout.wrap(bytes32(_blob));
  }

  /**
   * @notice Set fieldLayout.
   */
  function setFieldLayout(ResourceId tableId, FieldLayout fieldLayout) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(FieldLayout.unwrap(fieldLayout)), _fieldLayout);
  }

  /**
   * @notice Set fieldLayout.
   */
  function _setFieldLayout(ResourceId tableId, FieldLayout fieldLayout) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(FieldLayout.unwrap(fieldLayout)), _fieldLayout);
  }

  /**
   * @notice Get keySchema.
   */
  function getKeySchema(ResourceId tableId) internal view returns (Schema keySchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return Schema.wrap(bytes32(_blob));
  }

  /**
   * @notice Get keySchema.
   */
  function _getKeySchema(ResourceId tableId) internal view returns (Schema keySchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return Schema.wrap(bytes32(_blob));
  }

  /**
   * @notice Set keySchema.
   */
  function setKeySchema(ResourceId tableId, Schema keySchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked(Schema.unwrap(keySchema)), _fieldLayout);
  }

  /**
   * @notice Set keySchema.
   */
  function _setKeySchema(ResourceId tableId, Schema keySchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked(Schema.unwrap(keySchema)), _fieldLayout);
  }

  /**
   * @notice Get valueSchema.
   */
  function getValueSchema(ResourceId tableId) internal view returns (Schema valueSchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return Schema.wrap(bytes32(_blob));
  }

  /**
   * @notice Get valueSchema.
   */
  function _getValueSchema(ResourceId tableId) internal view returns (Schema valueSchema) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return Schema.wrap(bytes32(_blob));
  }

  /**
   * @notice Set valueSchema.
   */
  function setValueSchema(ResourceId tableId, Schema valueSchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked(Schema.unwrap(valueSchema)), _fieldLayout);
  }

  /**
   * @notice Set valueSchema.
   */
  function _setValueSchema(ResourceId tableId, Schema valueSchema) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked(Schema.unwrap(valueSchema)), _fieldLayout);
  }

  /**
   * @notice Get abiEncodedKeyNames.
   */
  function getAbiEncodedKeyNames(ResourceId tableId) internal view returns (bytes memory abiEncodedKeyNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (bytes(_blob));
  }

  /**
   * @notice Get abiEncodedKeyNames.
   */
  function _getAbiEncodedKeyNames(ResourceId tableId) internal view returns (bytes memory abiEncodedKeyNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (bytes(_blob));
  }

  /**
   * @notice Set abiEncodedKeyNames.
   */
  function setAbiEncodedKeyNames(ResourceId tableId, bytes memory abiEncodedKeyNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, bytes((abiEncodedKeyNames)));
  }

  /**
   * @notice Set abiEncodedKeyNames.
   */
  function _setAbiEncodedKeyNames(ResourceId tableId, bytes memory abiEncodedKeyNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, bytes((abiEncodedKeyNames)));
  }

  /**
   * @notice Get the length of abiEncodedKeyNames.
   */
  function lengthAbiEncodedKeyNames(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of abiEncodedKeyNames.
   */
  function _lengthAbiEncodedKeyNames(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of abiEncodedKeyNames.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemAbiEncodedKeyNames(ResourceId tableId, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Get an item of abiEncodedKeyNames.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemAbiEncodedKeyNames(ResourceId tableId, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Push a slice to abiEncodedKeyNames.
   */
  function pushAbiEncodedKeyNames(ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Push a slice to abiEncodedKeyNames.
   */
  function _pushAbiEncodedKeyNames(ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from abiEncodedKeyNames.
   */
  function popAbiEncodedKeyNames(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Pop a slice from abiEncodedKeyNames.
   */
  function _popAbiEncodedKeyNames(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Update a slice of abiEncodedKeyNames at `_index`.
   */
  function updateAbiEncodedKeyNames(ResourceId tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of abiEncodedKeyNames at `_index`.
   */
  function _updateAbiEncodedKeyNames(ResourceId tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get abiEncodedFieldNames.
   */
  function getAbiEncodedFieldNames(ResourceId tableId) internal view returns (bytes memory abiEncodedFieldNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (bytes(_blob));
  }

  /**
   * @notice Get abiEncodedFieldNames.
   */
  function _getAbiEncodedFieldNames(ResourceId tableId) internal view returns (bytes memory abiEncodedFieldNames) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (bytes(_blob));
  }

  /**
   * @notice Set abiEncodedFieldNames.
   */
  function setAbiEncodedFieldNames(ResourceId tableId, bytes memory abiEncodedFieldNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, bytes((abiEncodedFieldNames)));
  }

  /**
   * @notice Set abiEncodedFieldNames.
   */
  function _setAbiEncodedFieldNames(ResourceId tableId, bytes memory abiEncodedFieldNames) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, bytes((abiEncodedFieldNames)));
  }

  /**
   * @notice Get the length of abiEncodedFieldNames.
   */
  function lengthAbiEncodedFieldNames(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of abiEncodedFieldNames.
   */
  function _lengthAbiEncodedFieldNames(ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of abiEncodedFieldNames.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemAbiEncodedFieldNames(ResourceId tableId, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Get an item of abiEncodedFieldNames.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemAbiEncodedFieldNames(ResourceId tableId, uint256 _index) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Push a slice to abiEncodedFieldNames.
   */
  function pushAbiEncodedFieldNames(ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Push a slice to abiEncodedFieldNames.
   */
  function _pushAbiEncodedFieldNames(ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from abiEncodedFieldNames.
   */
  function popAbiEncodedFieldNames(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Pop a slice from abiEncodedFieldNames.
   */
  function _popAbiEncodedFieldNames(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Update a slice of abiEncodedFieldNames at `_index`.
   */
  function updateAbiEncodedFieldNames(ResourceId tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of abiEncodedFieldNames at `_index`.
   */
  function _updateAbiEncodedFieldNames(ResourceId tableId, uint256 _index, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(ResourceId tableId) internal view returns (TablesData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(ResourceId tableId) internal view returns (TablesData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    (bytes memory _staticData, EncodedLengths _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    ResourceId tableId,
    FieldLayout fieldLayout,
    Schema keySchema,
    Schema valueSchema,
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal {
    bytes memory _staticData = encodeStatic(fieldLayout, keySchema, valueSchema);

    EncodedLengths _encodedLengths = encodeLengths(abiEncodedKeyNames, abiEncodedFieldNames);
    bytes memory _dynamicData = encodeDynamic(abiEncodedKeyNames, abiEncodedFieldNames);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    ResourceId tableId,
    FieldLayout fieldLayout,
    Schema keySchema,
    Schema valueSchema,
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal {
    bytes memory _staticData = encodeStatic(fieldLayout, keySchema, valueSchema);

    EncodedLengths _encodedLengths = encodeLengths(abiEncodedKeyNames, abiEncodedFieldNames);
    bytes memory _dynamicData = encodeDynamic(abiEncodedKeyNames, abiEncodedFieldNames);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(ResourceId tableId, TablesData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.fieldLayout, _table.keySchema, _table.valueSchema);

    EncodedLengths _encodedLengths = encodeLengths(_table.abiEncodedKeyNames, _table.abiEncodedFieldNames);
    bytes memory _dynamicData = encodeDynamic(_table.abiEncodedKeyNames, _table.abiEncodedFieldNames);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(ResourceId tableId, TablesData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.fieldLayout, _table.keySchema, _table.valueSchema);

    EncodedLengths _encodedLengths = encodeLengths(_table.abiEncodedKeyNames, _table.abiEncodedFieldNames);
    bytes memory _dynamicData = encodeDynamic(_table.abiEncodedKeyNames, _table.abiEncodedFieldNames);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (FieldLayout fieldLayout, Schema keySchema, Schema valueSchema) {
    fieldLayout = FieldLayout.wrap(Bytes.getBytes32(_blob, 0));

    keySchema = Schema.wrap(Bytes.getBytes32(_blob, 32));

    valueSchema = Schema.wrap(Bytes.getBytes32(_blob, 64));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    EncodedLengths _encodedLengths,
    bytes memory _blob
  ) internal pure returns (bytes memory abiEncodedKeyNames, bytes memory abiEncodedFieldNames) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    abiEncodedKeyNames = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    abiEncodedFieldNames = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory _staticData,
    EncodedLengths _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (TablesData memory _table) {
    (_table.fieldLayout, _table.keySchema, _table.valueSchema) = decodeStatic(_staticData);

    (_table.abiEncodedKeyNames, _table.abiEncodedFieldNames) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    FieldLayout fieldLayout,
    Schema keySchema,
    Schema valueSchema
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(fieldLayout, keySchema, valueSchema);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal pure returns (EncodedLengths _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = EncodedLengthsLib.pack(bytes(abiEncodedKeyNames).length, bytes(abiEncodedFieldNames).length);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(bytes((abiEncodedKeyNames)), bytes((abiEncodedFieldNames)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    FieldLayout fieldLayout,
    Schema keySchema,
    Schema valueSchema,
    bytes memory abiEncodedKeyNames,
    bytes memory abiEncodedFieldNames
  ) internal pure returns (bytes memory, EncodedLengths, bytes memory) {
    bytes memory _staticData = encodeStatic(fieldLayout, keySchema, valueSchema);

    EncodedLengths _encodedLengths = encodeLengths(abiEncodedKeyNames, abiEncodedFieldNames);
    bytes memory _dynamicData = encodeDynamic(abiEncodedKeyNames, abiEncodedFieldNames);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(ResourceId tableId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = ResourceId.unwrap(tableId);

    return _keyTuple;
  }
}
