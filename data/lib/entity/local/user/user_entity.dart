import 'package:data/db/floor/constants/database_tables.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:floor/floor.dart';

@Entity(tableName: Table.USER)
class UserEntity extends BaseLayerDataTransformer<UserEntity, int> {
  @primaryKey
  int? id;

  UserEntity({this.id});

  @override
  UserEntity restore(int data) {
    return UserEntity(id: data);
  }

  @override
  int transform() {
    return id!;
  }
}
