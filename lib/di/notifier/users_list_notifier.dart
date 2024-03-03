import 'package:domain/model/get_modules_response/users_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allUsersListNotifierProvider =
    StateNotifierProvider<UsersListNotifier, List<UsersListResponseData>>((ref) {
  return UsersListNotifier();
});

class UsersListNotifier extends StateNotifier<List<UsersListResponseData>> {
  UsersListNotifier() : super([]);

  setData(List<UsersListResponseData> data) {
    state = data;
  }
}