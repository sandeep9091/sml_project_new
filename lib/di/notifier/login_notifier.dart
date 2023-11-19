import 'package:domain/model/login/login_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, List<LoginResponseData>>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<List<LoginResponseData>> {
  LoginNotifier() : super([]);

  setData(List<LoginResponseData> data) {
    state = data;
  }
}