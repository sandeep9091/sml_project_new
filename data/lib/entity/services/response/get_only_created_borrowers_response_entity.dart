import 'package:domain/model/get_modules_response/get_only_created_borrowers_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_only_created_borrowers_response_entity.g.dart';

@JsonSerializable()
class GetOnlyCreatedBorrowersResponseEntity
    extends BaseLayerDataTransformer<GetOnlyCreatedBorrowersResponseEntity, GetOnlyCreatedBorrowersResponse> {
  @JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GetOnlyCreatedBorrowersResponseDataEntity> data;

  GetOnlyCreatedBorrowersResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetOnlyCreatedBorrowersResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetOnlyCreatedBorrowersResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetOnlyCreatedBorrowersResponseEntityToJson(this);

  @override
  GetOnlyCreatedBorrowersResponse transform() {
    return GetOnlyCreatedBorrowersResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GetOnlyCreatedBorrowersResponseDataEntity
    extends BaseLayerDataTransformer<GetOnlyCreatedBorrowersResponseDataEntity, GetOnlyCreatedBorrowersResponseData> {
  @JsonKey(name: "_id", defaultValue: "")
  final String id;
  @JsonKey(name: "name", defaultValue: "")
  final String name;

  GetOnlyCreatedBorrowersResponseDataEntity({
    required this.id,
    required this.name
  });

  factory GetOnlyCreatedBorrowersResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetOnlyCreatedBorrowersResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetOnlyCreatedBorrowersResponseDataEntityToJson(this);

  @override
  GetOnlyCreatedBorrowersResponseData transform() {
    return GetOnlyCreatedBorrowersResponseData(id: id,name: name);
  }
}