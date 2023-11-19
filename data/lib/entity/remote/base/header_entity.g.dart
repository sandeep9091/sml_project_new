// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeaderEntity _$HeaderEntityFromJson(Map<String, dynamic> json) => HeaderEntity(
      channelName: json['X-IMI-CHANNEL'] as String?,
      language: json['X-IMI-LANGUAGE'] as String?,
      oAuth: json['x-imi-oauth'] as String?,
      tokenId: json['X-IMI-TOKENID'] as String?,
      authorisation: json['Authorization'] as String? ?? '',
      deviceOS: json['X-IMI-App-OS'] as String?,
      uniqueTimeStamp: json['X-IMI-UID'] as String?,
      osVersion: json['X-IMI-App-OSVersion'] as String? ?? '',
      xOS: json['X-OS'] as String?,
      appModel: json['X-IMI-App-Model'] as String?,
      appOEM: json['X-IMI-App-OEM'] as String?,
      appVersion: json['X-IMI-VERSION'] as String?,
      forwardIP: json['X-IMI-FORWARDIP'] as String? ?? '',
      userAgent: json['X-IMI-App-User-Agent'] as String? ?? 'Mozilla',
      authKey: json['X-IMI-AUTHKEY'] as String? ?? '',
    )
      ..currentDateTime = json['X-IMI-DT'] as String?
      ..signatureValue = json['X-IMI-SIGNATURE'] as String?;

Map<String, dynamic> _$HeaderEntityToJson(HeaderEntity instance) =>
    <String, dynamic>{
      'X-IMI-AUTHKEY': instance.authKey,
      'X-IMI-App-OS': instance.deviceOS,
      'X-IMI-App-Model': instance.appModel,
      'X-OS': instance.xOS,
      'X-IMI-CHANNEL': instance.channelName,
      'X-IMI-App-OEM': instance.appOEM,
      'X-IMI-LANGUAGE': instance.language,
      'X-IMI-VERSION': instance.appVersion,
      'X-IMI-App-OSVersion': instance.osVersion,
      'X-IMI-DT': instance.currentDateTime,
      'X-IMI-UID': instance.uniqueTimeStamp,
      'Authorization': instance.authorisation,
      'X-IMI-SIGNATURE': instance.signatureValue,
      'x-imi-oauth': instance.oAuth,
      'X-IMI-TOKENID': instance.tokenId,
      'X-IMI-FORWARDIP': instance.forwardIP,
      'X-IMI-App-User-Agent': instance.userAgent,
    };
