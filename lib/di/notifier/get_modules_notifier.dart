import 'package:domain/model/get_modules_response/get_modules_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getModulesNotifierProvider =
    StateNotifierProvider<GetModulesNotifier, List<GetModulesResponseData>>((ref) {
  return GetModulesNotifier();
});

class GetModulesNotifier extends StateNotifier<List<GetModulesResponseData>> {
  GetModulesNotifier() : super([]);

  setData(List<GetModulesResponseData> data) {
    state = data;
  }
}