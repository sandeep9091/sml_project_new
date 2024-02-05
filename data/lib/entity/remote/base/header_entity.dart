import 'package:json_annotation/json_annotation.dart';

part "header_entity.g.dart";

@JsonSerializable()
class HeaderEntity {
  @JsonKey(name: "Content-Type", defaultValue: "application/json")
  String contentType;
  @JsonKey(name: "isCrypto", defaultValue: "N")
  String isCrypto;

  HeaderEntity({
    required this.contentType,
    required this.isCrypto
  });

  factory HeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$HeaderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderEntityToJson(this);
}
