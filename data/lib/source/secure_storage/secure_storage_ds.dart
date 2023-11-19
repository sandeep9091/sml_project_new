import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageDataSource {
  Future<String> getValue({required String key});
  Future<void> setValue({required String key, required String value});
  Future<void> clearData();
  Future<void> deleteValue({required String key});
}

class SecureStorageDataSourceImpl extends SecureStorageDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  @override
  Future<String> getValue({required String key}) async {
    try {
      return await _storage.read(key: key) ?? "";
    } catch (e) {
      return "";
    }
  }

  @override
  Future<void> setValue({required String key, required String value}) async {
    debugPrint("setValue:$this::$key $value");

    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      //
    }
  }

  @override
  Future<void> clearData() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> deleteValue({required String key}) async {
    try {
      return await _storage.delete(key: key);
    } catch (e) {
      //
    }
  }
}
