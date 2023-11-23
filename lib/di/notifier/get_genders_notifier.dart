import 'package:domain/model/services/get_gender_list_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getGenderListNotifierProvider =
    StateNotifierProvider<GetGenderListNotifier, List<GetGenderListResponseData>>((ref) {
  return GetGenderListNotifier();
});

class GetGenderListNotifier extends StateNotifier<List<GetGenderListResponseData>> {
  GetGenderListNotifier() : super([]);

  setData(List<GetGenderListResponseData> data) {
    state = data;
  }
}