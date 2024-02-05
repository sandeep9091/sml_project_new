
import 'package:domain/model/get_modules_response/dashboard_response.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'getDashboard_response_entity.g.dart';

@JsonSerializable()
class GetDashboardResponseEntity
    extends BaseLayerDataTransformer<GetDashboardResponseEntity, GetDashboardResponse> {
@JsonKey(name: "S_CODE", defaultValue: 0)
  final int sCode;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String sMessage;
  @JsonKey(name: "DATA", defaultValue: [])
  final List<GetDashboardResponseDataEntity> data;

  GetDashboardResponseEntity({
    required this.sCode,
    required this.sMessage,
    required this.data,
  });

  factory GetDashboardResponseEntity.fromJson(Map<String, Object?> json) =>
      _$GetDashboardResponseEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetDashboardResponseEntityToJson(this);

  @override
  GetDashboardResponse transform() {
    return GetDashboardResponse(
      sCode: sCode,
      sMessage: sMessage,
      data: data.map((e) => e.transform()).toList());
  }
}

@JsonSerializable()
class GetDashboardResponseDataEntity
    extends BaseLayerDataTransformer<GetDashboardResponseDataEntity, GetDashboardResponseData> {
  @JsonKey(name: "header", defaultValue: "")
  final String header;
  @JsonKey(name: "cnt", defaultValue: -1)
  final int cnt;
  @JsonKey(name: "newCnt", defaultValue: -1)
  final int newCnt;
  @JsonKey(name: "last7Cnt", defaultValue: -1)
  final int last7Cnt;
  @JsonKey(name: "activeCnt", defaultValue: -1)
  final int activeCnt;
  @JsonKey(name: "inActiveCnt", defaultValue: -1)
  final int inActiveCnt;

  GetDashboardResponseDataEntity({
    required this.header,
    required this.cnt,
    required this.newCnt,
    required this.last7Cnt,
    required this.activeCnt,
    required this.inActiveCnt,
  });

  factory GetDashboardResponseDataEntity.fromJson(Map<String, Object?> json) =>
      _$GetDashboardResponseDataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$GetDashboardResponseDataEntityToJson(this);

  @override
  GetDashboardResponseData transform() {
    return GetDashboardResponseData(header: header, cnt: cnt, newCnt: newCnt, last7Cnt: last7Cnt, activeCnt: activeCnt, inActiveCnt: inActiveCnt);
  }
}