import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:data/entity/remote/helper/rc4_encryption_helper.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class EncryptionHelper {
  static String genSignature(Map<String, dynamic> reqBody, String salt) {
    String srespone = '';
    try {
      // reqBody = jsonDecode(reqBody.toString());
      srespone = "REQBODY=${jsonEncode(reqBody)}&SALT=$salt";
      debugPrint('srespone$srespone');
      srespone = getSHA512(srespone);
    } on Exception catch (exception) {
      debugPrint('genSignature exception:$exception');
    } catch (error) {
      debugPrint('genSignature error:$error');
      srespone = 'error';
    }
    return srespone;
  }

  static String getSHA512(String s) {
    try {
      final hashvalue = sha512.convert(utf8.encode(s));
      return hashvalue.toString();
    } on Exception catch (exception) {
      debugPrint('getSHA512 exception:$exception');
    } catch (error) {
      debugPrint('getSHA512 error:$error');
      return '';
    }
    return '';
  }

  static String getOddNumber(String t) {
    var v = '';
    try {
      for (int i = 0; i < t.length;) {
        v += t[i];
        i = i + 2;
      }
    } on Exception catch (exception) {
      debugPrint('getOddNumber exception:$exception');
    } catch (error) {
      debugPrint('getOddNumber error:$error');
      return t;
    }
    return v.toString();
  }

  static String getUniqueID() {
    return const Uuid().v4().replaceAll("-", "").toUpperCase();
  }

  static String getRC4Encrypted({required String text, required String uid}) {
    return RC4().encode(text, uid);
  }

  static String getRC4Decrypted({required String text, required String uid}) {
    return RC4().decode(text, uid);
  }
}
