import 'package:domain/model/services/get_caders_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCadersNotifierProvider =
    StateNotifierProvider<GetCadersNotifier, List<GetCadersResponseData>>((ref) {
  return GetCadersNotifier();
});

class GetCadersNotifier extends StateNotifier<List<GetCadersResponseData>> {
  GetCadersNotifier() : super([]);

  setData(List<GetCadersResponseData> data) {
    state = data;
  }
}