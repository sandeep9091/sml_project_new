import 'package:json_annotation/json_annotation.dart';

part "header_entity.g.dart";

@JsonSerializable()
class HeaderEntity {
  // @JsonKey(name: "Content-Type", defaultValue: "application/json")
  @JsonKey(name: "Content-Type", defaultValue: "application/json")
  String contentType;

  HeaderEntity({
    required this.contentType
  });

  factory HeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$HeaderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderEntityToJson(this);
}
