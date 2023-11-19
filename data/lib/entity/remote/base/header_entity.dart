import 'package:json_annotation/json_annotation.dart';

part "header_entity.g.dart";

@JsonSerializable()
class HeaderEntity {
  // @JsonKey(name: "Content-Type", defaultValue: "application/json")
  @JsonKey(name: "X-IMI-AUTHKEY", defaultValue: "")
  String? authKey;
  @JsonKey(name: "X-IMI-App-OS")
  String? deviceOS;
  @JsonKey(name: "X-IMI-App-Model")
  String? appModel;
  @JsonKey(name: "X-OS")
  String? xOS;
  @JsonKey(name: "X-IMI-CHANNEL")
  String? channelName;
  @JsonKey(name: "X-IMI-App-OEM")
  String? appOEM;
  @JsonKey(name: "X-IMI-LANGUAGE")
  String? language;
  @JsonKey(name: "X-IMI-VERSION")
  String? appVersion;
  @JsonKey(name: "X-IMI-App-OSVersion", defaultValue: "")
  String? osVersion;
  @JsonKey(name: "X-IMI-DT")
  String? currentDateTime;
  @JsonKey(name: "X-IMI-UID")
  String? uniqueTimeStamp;
  @JsonKey(name: "Authorization", defaultValue: '')
  String? authorisation;
  @JsonKey(name: "X-IMI-SIGNATURE")
  String? signatureValue;
  @JsonKey(name: "x-imi-oauth")
  String? oAuth;
  @JsonKey(name: "X-IMI-TOKENID")
  String? tokenId;
  @JsonKey(name: "X-IMI-FORWARDIP", defaultValue: "")
  String? forwardIP;
  @JsonKey(name: "X-IMI-App-User-Agent", defaultValue: "Mozilla")
  String? userAgent;

  // @JsonKey(name: "X-IMI-App-Res")
  // String? screenResolution;

  HeaderEntity({
    this.channelName,
    this.language,
    this.oAuth,
    this.tokenId,
    this.authorisation,
    this.deviceOS,
    // this.deviceUniqueID,
    this.uniqueTimeStamp,
    this.osVersion,
    this.xOS,
    this.appModel,
    this.appOEM,
    this.appVersion,
    this.forwardIP,
    this.userAgent,
    this.authKey,
  });

  factory HeaderEntity.fromJson(Map<String, dynamic> json) =>
      _$HeaderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderEntityToJson(this);
}
