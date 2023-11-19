import 'dart:io';
import 'dart:math';

import 'package:data/entity/remote/base/header_entity.dart';
import 'package:data/network/network_properties.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import '../../../db/constants/pref_keys.dart';
import '../../../db/preferences/preferences.dart';
import '../../../source/secure_storage/secure_storage_ds.dart';

class DeviceInfoHelper {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final SecureStorageDataSource _secureStorageDataSource;

  String uuid = "";

  DeviceInfoHelper(this._secureStorageDataSource) {
    uuid = const Uuid().v4().replaceAll("-", "").toUpperCase();
  }

  String platformType() {
    return Platform.isAndroid ? 'A' : 'I';
  }

  ///Load device subscription_type_info to submit as base class in api.
  Future<HeaderEntity> getDeviceInfo() async {
    Map<String, dynamic> deviceData = await initPlatformState();
    final PackageInfo info = await PackageInfo.fromPlatform();
    // String wifiIP = await getIpAddress();
    // debugPrint("getIpAddress " + wifiIP.toString());

    // final ConnectivityResult connectivityInfo =
    //     await _connectivity.checkConnectivity();
    String externalIp = "";
    String deviceUniqueID = "";
    String deviceName = "";
    String deviceOS = "OTHER";
    String appOEM = "Apple";
    String appVersion = info.version;
    String osVersion = "16.2"; //Platform.operatingSystemVersion;

    String locale =
        await UserPreference.getValue(key: PrefKeys.language) ?? "id";

    if (kIsWeb) {
      deviceOS = "WEB";
      appOEM = "WEB";
    }
    if (Platform.isAndroid) {
      deviceOS = "ANDROID";
      appOEM = "ANDROID";
      if (deviceData.containsKey("id")) {
        deviceUniqueID = deviceData["id"];
      }
      if (deviceData.containsKey("brand")) {
        deviceName = deviceData["brand"];
      }
      if (deviceData.containsKey("model")) {
        deviceName = "$deviceName ${deviceData["model"]}";
        deviceName = deviceName.trim();
      }
    } else if (Platform.isIOS) {
      deviceOS = "iOS";
      appOEM = "APPLE";
      if (deviceData.containsKey("identifierForVendor")) {
        deviceUniqueID = deviceData["identifierForVendor"];
      }
      if (deviceData.containsKey("name")) {
        deviceName = deviceData["name"];
      }
    }
    String language =
        await _secureStorageDataSource.getValue(key: PrefKeys.language);
    // if (language.isEmpty) {
    //   language = "en";
    //   await _secureStorageDataSource.setValue(
    //       key: PrefKeys.language, value: language);
    // }
    return HeaderEntity(
      language: locale.toUpperCase(),
      // TODO: change channel name to salestoolftth when realse
      channelName: 'BSNL',
      deviceOS: deviceOS,
      appModel: deviceOS,
      xOS: deviceOS,
      appOEM: appOEM,
      appVersion: appVersion,

      authKey: NetworkProperties.AUTH_KEY,
      osVersion: osVersion,
      forwardIP:
          await _secureStorageDataSource.getValue(key: PrefKeys.forwardIP),
      userAgent:
          await _secureStorageDataSource.getValue(key: PrefKeys.userAgent),
      // deviceUniqueID: deviceUniqueID,
    );
  }

  Future<Map<String, dynamic>> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        WebBrowserInfo _info = await _deviceInfoPlugin.webBrowserInfo;
        deviceData = _info.data; //_info.toMap();
      } else {
        if (Platform.isAndroid) {
          AndroidDeviceInfo _info = await _deviceInfoPlugin.androidInfo;
          deviceData = _info.data; //_info.toMap();
        } else if (Platform.isIOS) {
          IosDeviceInfo _info = await _deviceInfoPlugin.iosInfo;
          deviceData = _info.data; //_info.toMap();
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  paymentHeader() {
    Map<String, dynamic> extraHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'BD-Timestamp': getDBTimeStamp(),
      'BD-TraceId': getBDTraceId(),
    };
    return extraHeaders;
  }

  String getDBTimeStamp() {
    DateTime now = DateTime.now();
    var time = DateFormat('yyyyMMddHHmmss').format(now);
    return time;
  }

  String getBDTraceId() {
    final random = Random();
    const availableChars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(
            5, (index) => availableChars[random.nextInt(availableChars.length)])
        .join();

    return getDBTimeStamp() + randomString;
  }
}
