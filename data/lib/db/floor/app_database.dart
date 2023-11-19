import 'dart:async';

import 'package:data/db/floor/dao/users_dao.dart';
import 'package:data/entity/local/user/user_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'database_properties.dart';

part 'app_database.g.dart';

@Database(version: DatabaseProperties.DB_VERSION, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  UsersDao get userDao;
}
