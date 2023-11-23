import 'package:json_annotation/json_annotation.dart';

part 'common_request_entity.g.dart';

@JsonSerializable()
class CommonRequestEntity {
  @JsonKey(name: "secure", defaultValue: "")
  final String secure;

  factory CommonRequestEntity.fromJson(Map<String, Object?> json) =>
      _$CommonRequestEntityFromJson(json);

  CommonRequestEntity({
    required this.secure,
  });

  Map<String, dynamic> toJson() => _$CommonRequestEntityToJson(this);
}
