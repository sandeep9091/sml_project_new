import 'package:data/entity/remote/base/header_entity.dart';
import 'package:data/source/secure_storage/secure_storage_ds.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../db/constants/pref_keys.dart';
import '../entity/remote/helper/device_helper.dart';
import '../entity/remote/helper/encyption_helper.dart';

class ApiInterceptor extends InterceptorsWrapper {
  String authToken = "";
  final DeviceInfoHelper _deviceHelper;
  final SecureStorageDataSource _secureStorageDataSource;

  ApiInterceptor(this._deviceHelper, this._secureStorageDataSource);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.contains("payments/v1_2/orders/get")) {
      options.headers.addEntries(_deviceHelper.paymentHeader().entries);
    } else {
      HeaderEntity appHeader = await _deviceHelper.getDeviceInfo();

      //appHeader.currentDateTime = DateTime.now().toString();
      //appHeader.uniqueTimeStamp = DateTime.now().microsecondsSinceEpoch.toString();

      //This needs to be changed - need to handle dynamically, based on language selection
      String lang =
          await _secureStorageDataSource.getValue(key: PrefKeys.language);
      //appHeader.language = lang.isEmpty ? 'en' : lang;

      String uid =
          "${_deviceHelper.uuid}${DateTime.now().microsecondsSinceEpoch.toString()}";

      // String uid = _deviceHelper.uuid;
      if (options.data is Map<String, dynamic> &&
          !options.path.contains("profile/uploadphoto")) {
        Map<String, dynamic> request = options.data as Map<String, dynamic>;

        if (request.containsKey("headeruniqueid")) {
          try {
            uid = request["headeruniqueid"] as String;
          } catch (error) {
            uid =
                "${_deviceHelper.uuid}${DateTime.now().microsecondsSinceEpoch.toString()}";
          }
          try {
            (options.data as Map<String, dynamic>).remove("headeruniqueid");
          } finally {}
        }
        var tokenId = await _secureStorageDataSource.getValue(
          key: PrefKeys.tokenId,
        );
        //appHeader.tokenId = tokenId;

        //String salt = EncryptionHelper.getOddNumber(tokenId);

        // String requestBody = EncryptionHelper.genSignature(
        //   request,
        //   salt,
        // );

        // if (NetworkProperties.checkResponseTampered) {
        //   appHeader.resposeTokenId =
        //       DateTime.now().microsecondsSinceEpoch.toString();
        //   RequestSaltKeys.addKey(
        //       options.uri.toString().toLowerCase(), appHeader.resposeTokenId!);

        //   debugPrint(
        //       "\n\tSECURITY Request URL: ${options.uri.toString().toLowerCase()} :: Header: ${appHeader.resposeTokenId!}");
        // }
        //appHeader.oAuth = requestBody;
        //appHeader.signatureValue = requestBody;
        //appHeader.authorisation = NetworkProperties.AKEY;
        //appHeader.authKey = NetworkProperties.AUTH_KEY;
      }

      // if (!options.path.contains("payments/v1_2/orders/get")) {
      if (options.path.contains("/province")) {
        options.headers["bypass"] = true;
      } else {
        options.headers.removeWhere((key, value) => key == "bypass");
      }
      options.headers.addAll(appHeader.toJson());
      // }

      debugPrint("headers------- ${options.headers}");
    }
    options;
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    try {
      if (err.response!.statusCode == 401) {
        authToken = '';
        return super.onError(err, handler);
      }
      if (err.response!.data != null) {
        if (((err.response!.data as Map<String, dynamic>)['response']['token']
                    as String?)
                ?.isNotEmpty ??
            false) {
          authToken = (err.response!.data as Map<String, dynamic>)['response']
                  ['token'] ??
              '';
        }
      }
    } catch (e) {}

    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        "\n\tSECURITY RESPONSE URL:${response.realUri.toString().toLowerCase()} :: HEADERS: ${response.headers.map}");
    debugPrint(
        "I am response header ${response.headers.value('X-IMI-TOKENID')}");
    // debugPrint("I am response data ${response.data}");

    String tokenid = "";
    if (response.headers.map.containsKey('X-IMI-TOKENID')) {
      tokenid = response.headers.value('X-IMI-TOKENID') ?? "";
      await _secureStorageDataSource.setValue(
          key: PrefKeys.tokenId, value: tokenid);
    }
    if (response.data != null) {
      try {
        // Map<String, dynamic> res = response.data as Map<String, dynamic>;
        // if (tokenid.isEmpty) {
        //   if (res["status"] == "0" && res.containsKey("data")) {
        //     Map<String, dynamic> data = res["data"] as Map<String, dynamic>;
        //     if (data.containsKey("tokenid")) {
        //       tokenid = data["tokenid"].toString();
        //       await _secureStorageDataSource.setValue(
        //           key: PrefKeys.tokenId, value: tokenid);
        //     }
        //   }
        // }
        /* if (NetworkProperties.checkResponseTampered) {
          String requestURL = response.realUri.toString().toLowerCase();
          if (response.headers.map.containsKey("oauth") &&
              !bypassCheck(requestURL)) {
            String tokenId = RequestSaltKeys.getValue(requestURL) ?? "";
            debugPrint(
                "\n\tSECURITY RESPONSE ReqURL: $requestURL :: TokenID: $tokenId");

            RequestSaltKeys.remove(requestURL);

            if (!(await verifyResponse(
              response: res,
              oAuthToken: response.headers.value('oauth') ?? "",
              tokenId: tokenId,
            ))) {
              //SERVER RESPONSE TAMPERED

              super.onResponse(
                Response(
                  statusCode: 401,
                  data: {
                    "status": NetworkProperties.responseTamperedErrorCode,
                    "message": "RESPONSE_TAMPERED",
                    "code": NetworkProperties.responseTamperedErrorCode
                  },
                  requestOptions: response.requestOptions,
                ),
                handler,
              );

              return;
            }
          }
        } */
      } catch (e) {
        debugPrint("Interceptor onResponse Error: ${e.toString()}");
      }
    }
    debugPrint("tokenid: $tokenid");
    super.onResponse(response, handler);
  }

  bool bypassCheck(String requestUrl) {
    List<String> bypassURLs = [
      '/banners/getbyid',
      '/template/getdata',
    ];
    for (var urlPart in bypassURLs) {
      if (requestUrl.toLowerCase().contains(urlPart)) {
        return true;
      }
    }
    return false;
  }

  Future<bool> verifyResponse({
    required Map<String, dynamic> response,
    required String oAuthToken,
    required String tokenId,
  }) async {
    bool bReturn = false;
    String salt = EncryptionHelper.getOddNumber(tokenId);

    String responseHash = EncryptionHelper.genSignature(
      response,
      salt,
    );
    bReturn = (responseHash.toUpperCase() == oAuthToken.toUpperCase());
    debugPrint(
        "\n\tSECURITY Server Hash: ${oAuthToken.toUpperCase()}\n\tSECURITY Response hash: ${responseHash.toUpperCase()}\n\tSECURITY Match: ${bReturn.toString()}");

    return bReturn;
  }
}
