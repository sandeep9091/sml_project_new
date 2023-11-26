import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main/app_viewmodel.dart';
import '../../ui/molecules/drawer/drawer_view_model.dart';

ChangeNotifierProvider<AppViewModel> appViewModel =
    ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(),
);

final drawerViewModelProvider = ChangeNotifierProvider<DrawerViewModel>(
  (ref) => DrawerViewModel(),
);
//branchesViewModelProvider