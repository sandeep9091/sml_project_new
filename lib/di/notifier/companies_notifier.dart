import 'package:domain/model/get_modules_response/companies_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final companiesNotifierProvider =
    StateNotifierProvider<CompaniesNotifier, List<CompaniesListResponseData>>((ref) {
  return CompaniesNotifier();
});

class CompaniesNotifier extends StateNotifier<List<CompaniesListResponseData>> {
  CompaniesNotifier() : super([]);

  setData(List<CompaniesListResponseData> data) {
    state = data;
  }
}