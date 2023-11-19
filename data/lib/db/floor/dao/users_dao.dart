import 'package:data/db/floor/constants/database_tables.dart';
import 'package:data/db/floor/dao/base/base_dao.dart';
import 'package:data/entity/local/user/user_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class UsersDao extends BaseDao<UserEntity> {
  @override
  @delete
  Future<int> deleteItem(UserEntity entity);

  @update
  Future<int> updateUser(UserEntity order);

  @Query("SELECT * FROM ${Table.USER} WHERE id = :id")
  Future<UserEntity?> getUserById(int id);

  @Query("SELECT * FROM ${Table.USER}")
  Stream<List<UserEntity>> getAllUsers();

  @transaction
  Future<int> insertUser(UserEntity user) async {
    try {
      UserEntity? userEntity = await getUserById(user.id ?? -1);
      if (userEntity != null) {
        await updateUser(user);
        int index = await insertData(user);
        return index;
      } else {
        int index = await insertData(user);
        return index;
      }
    } catch (exception) {
      return -1;
    }
  }

  Future<bool> deleteUser(int id) async {
    try {
      UserEntity? user = await getUserById(id);
      if (user != null) {
        int index = await deleteItem(user);
        return index > 0;
      }
      return false;
    } catch (exception) {
      return false;
    }
  }
}
