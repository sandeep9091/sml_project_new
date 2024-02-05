import 'package:domain/model/services/address_master_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_master_response_entity.g.dart';

@JsonSerializable()
class AddressMasterResponseEntity
    extends BaseLayerDataTransformer<AddressMasterResponseEntity, AddressMasterResponse> {
  @JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<AddressMasterResponseDataEntity> data;

  AddressMasterResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory AddressMasterResponseEntity.fromJson(Map<String, Object?> json) =>
      _$AddressMasterResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddressMasterResponseEntityToJson(this);

  @override
  AddressMasterResponse transform() {
    return AddressMasterResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class AddressMasterResponseDataEntity
    extends BaseLayerDataTransformer<AddressMasterResponseDataEntity, AddressMasterResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "data", defaultValue: [])
  final List<AddressDataEntity> addressData;

  AddressMasterResponseDataEntity({
    required this.id,
    required this.addressData
  });

  factory AddressMasterResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$AddressMasterResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddressMasterResponseDataEntityToJson(this);

  @override
  AddressMasterResponseData transform() {
    return AddressMasterResponseData(id: id, addressData: addressData.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class AddressDataEntity
    extends BaseLayerDataTransformer<AddressDataEntity, AddressData> {
  @JsonKey(name: "name", defaultValue: "")
  final String name;
  @JsonKey(name: "code", defaultValue: "")
  final String code;
  @JsonKey(name: "states", defaultValue: [])
  final List<StatesEntity> states;

  AddressDataEntity({
    required this.name,
    required this.code,
    required this.states
  });

  factory AddressDataEntity.fromJson(Map<String, Object?> json) =>
      _$AddressDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDataEntityToJson(this);

  @override
  AddressData transform() {
    return AddressData(name: name, code: code, states: states.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class StatesEntity
    extends BaseLayerDataTransformer<StatesEntity, States> {
  @JsonKey(name: "name", defaultValue: "")
  final String name;
  @JsonKey(name: "cities", defaultValue: [])
  final List<CitiesEntity> cities;

  StatesEntity({
    required this.name,
    required this.cities
  });

  factory StatesEntity.fromJson(Map<String, Object?> json) =>
      _$StatesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$StatesEntityToJson(this);

  @override
  States transform() {
    return States(name: name, cities: cities.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class CitiesEntity
    extends BaseLayerDataTransformer<CitiesEntity, Cities> {
  @JsonKey(name: "cname", defaultValue: "")
  final String cname;
  @JsonKey(name: "code", defaultValue: "")
  final String code;

  CitiesEntity({
    required this.cname,
    required this.code
  });

  factory CitiesEntity.fromJson(Map<String, Object?> json) =>
      _$CitiesEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CitiesEntityToJson(this);

  @override
  Cities transform() {
    return Cities(cname: cname, code: code);
  }
}