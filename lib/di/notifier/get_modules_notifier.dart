import 'package:domain/model/get_modules_response/dashboard_response.dart';
import 'package:domain/model/get_modules_response/get_modules_new_response.dart';
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


final getDashboardNotifierProvider =
    StateNotifierProvider<GetDashboardNotifier, List<GetDashboardResponseData>>((ref) {
  return GetDashboardNotifier();
});

class GetDashboardNotifier extends StateNotifier<List<GetDashboardResponseData>> {
  GetDashboardNotifier() : super([]);

  setData(List<GetDashboardResponseData> data) {
    state = data;
  }
}

final getModulesNewNotifierProvider =
    StateNotifierProvider<GetModulesNewNotifier, List<GetModulesNewResponseData>>((ref) {
  return GetModulesNewNotifier();
});

class GetModulesNewNotifier extends StateNotifier<List<GetModulesNewResponseData>> {
  GetModulesNewNotifier() : super([]);

  setData(List<GetModulesNewResponseData> data) {    
    state = data;
  }
}