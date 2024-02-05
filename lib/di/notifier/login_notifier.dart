import 'package:domain/model/login/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUserInfoNotifierProvider =
    StateNotifierProvider<LoginNotifier, UserInfo?>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<UserInfo?> {
  LoginNotifier() : super(null);

  setData(UserInfo? data) {
    state = data;
  }
}