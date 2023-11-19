import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:domain/model/user_response/user_response.dart';

part 'users_response_entity.g.dart';

@JsonSerializable()
class UserDataEntity
    extends BaseLayerDataTransformer<UserDataEntity, UserData> {
  @JsonKey(name: "page", defaultValue: 0)
  final int page;
  @JsonKey(name: "per_page", defaultValue: 0)
  final int perPage;
  @JsonKey(name: "total", defaultValue: 0)
  final int total;
  @JsonKey(name: "total_pages", defaultValue: 0)
  final int totalPages;
  @JsonKey(name: "data", defaultValue: [])
  final List<DataEntity>? data;
  @JsonKey(name: "support")
  final SupportEntity? support;

  UserDataEntity({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory UserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataEntityToJson(this);

  @override
  UserData transform() {
    return UserData(
      page: page,
      perPage: perPage,
      total: total,
      totalPages: totalPages,
      data: data?.map((e) => e.transform()).toList(),
      support: support?.transform(),
    );
  }
}

@JsonSerializable()
class DataEntity extends BaseLayerDataTransformer<DataEntity, Data> {
  @JsonKey(name: "id", defaultValue: 0)
  final int id;
  @JsonKey(name: "email", defaultValue: "")
  final String email;
  @JsonKey(name: "first_name", defaultValue: "")
  final String firstName;
  @JsonKey(name: "last_name", defaultValue: "")
  final String lastName;
  @JsonKey(name: "avatar", defaultValue: "")
  final String avatar;

  DataEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DataEntityToJson(this);

  @override
  Data transform() {
    return Data(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      totalName: "$firstName $lastName",
    );
  }
}

@JsonSerializable()
class SupportEntity extends BaseLayerDataTransformer<SupportEntity, Support> {
  final String url;
  final String text;

  SupportEntity({
    required this.url,
    required this.text,
  });

  factory SupportEntity.fromJson(Map<String, dynamic> json) =>
      _$SupportEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SupportEntityToJson(this);

  @override
  Support transform() {
    return Support(
      text: text,
      url: url,
    );
  }
}
