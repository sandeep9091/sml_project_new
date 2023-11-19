import 'package:json_annotation/json_annotation.dart';

part 'login_request_entity.g.dart';

@JsonSerializable()
class LoginRequestEntity {
  @JsonKey(name: "secure", defaultValue: "")
  final String secure;

  factory LoginRequestEntity.fromJson(Map<String, Object?> json) =>
      _$LoginRequestEntityFromJson(json);

  LoginRequestEntity({
    required this.secure,
  });

  Map<String, dynamic> toJson() => _$LoginRequestEntityToJson(this);
}
