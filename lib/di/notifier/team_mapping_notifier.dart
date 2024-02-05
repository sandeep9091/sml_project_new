import 'package:domain/model/services/get_team_mapper_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teamMappingNotifierProvider =
    StateNotifierProvider<TeamMappingNotifier, List<CaderData>>((ref) {
  return TeamMappingNotifier();
});

class TeamMappingNotifier extends StateNotifier<List<CaderData>> {
  TeamMappingNotifier() : super([]);

  setData(List<CaderData> data) {
    state = data;
  }

  updateCheckBox(UsersData user, bool value){
    List<CaderData> listCopy = [...state];
    for (var element in listCopy) { 

      int index = element.usersData.indexWhere((each) => each.id == user.id);

      if (index != -1) {
      //element.usersData[index] = element.usersData[index].copyWith(isCheckBoxActive: value);
      }
      // for(var each in element.usersData){
      //   if(each.id == user.id){
      //     each.copyWith.call(isCheckBoxActive: value);
      //   }
      // }
      //state = finalData;
      state = listCopy;
      
    }

    // for(int i=0; i<=state.length; i++){
    //   for(int j=0; j<=state[i].usersData.length; j++){
    //     if(state[i].usersData[j].id == user.id){
    //       state[i].usersData[j].copyWith(isCheckBoxActive: value);
    //     }
    //   }
    // }

    state = state;
  }
}