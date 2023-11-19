import 'package:data/db/floor/database_properties.dart';
import 'package:data/db/floor/floor_db_service.dart';
import 'package:riverpod/riverpod.dart';

final floorAppDatabase = Provider<FloorDbService>(
  (ref) => FloorDbService(
    DatabaseProperties.DB_NAME,
  ),
);
