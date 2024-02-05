import 'package:domain/model/services/address_master_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addressMasterNotifierProvider =
    StateNotifierProvider<AddressMasterNotifier, List<AddressData>>((ref) {
  return AddressMasterNotifier();
});

class AddressMasterNotifier extends StateNotifier<List<AddressData>> {
  AddressMasterNotifier() : super([]);

  setData(List<AddressData> data) {
    state = data;
  }
}