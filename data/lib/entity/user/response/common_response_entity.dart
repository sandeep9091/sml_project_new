import 'package:domain/model/common_response/common_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common_response_entity.g.dart';

@JsonSerializable()
class CommonResponseEntity
    extends BaseLayerDataTransformer<CommonResponseEntity, CommonResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<dynamic> data;

  CommonResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory CommonResponseEntity.fromJson(Map<String, Object?> json) =>
      _$CommonResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$CommonResponseEntityToJson(this);

  @override
  CommonResponse transform() {
    return CommonResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}