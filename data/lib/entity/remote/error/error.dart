import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class Error {
  @JsonKey(name: "S_CODE")
  final int code;
  @JsonKey(name: "S_MSG", defaultValue: "")
  final String message;

  Error(this.code, this.message);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
