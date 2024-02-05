import 'package:domain/model/get_modules_response/branches_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final branchesNotifierProvider =
    StateNotifierProvider<BranchesNotifier, List<BranchesResponseData>>((ref) {
  return BranchesNotifier();
});

class BranchesNotifier extends StateNotifier<List<BranchesResponseData>> {
  BranchesNotifier() : super([]);

  setData(List<BranchesResponseData> data) {
    state = data;
  }
}