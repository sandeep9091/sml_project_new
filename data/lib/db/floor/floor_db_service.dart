import 'dart:async';

import 'package:data/db/floor/app_database.dart';
import 'package:floor/floor.dart';

class FloorDbService {
  static final FloorDbService connect = FloorDbService._internal();

  FloorDbService._internal();

  static String? dbName;

  factory FloorDbService(String databaseName) {
    dbName = databaseName;
    return connect;
  }

  static AppDatabase? _database;

  Future<AppDatabase?> get db async {
    _database ??= await _initializeDatabase();
    return _database;
  }

  final dbCallBack = Callback(
    onCreate: (database, version) async {
      /* database has been created */
    },
    onOpen: (database) async {
      /* database has been opened */
    },
    onUpgrade: (database, startVersion, endVersion) {
      /* database has been upgraded */
    },
  );

  Future<AppDatabase> _initializeDatabase() async {
    return await $FloorAppDatabase
        .databaseBuilder(dbName ?? "")
        .addCallback(dbCallBack)
        .build();
  }
}
