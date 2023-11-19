import 'package:data/db/preferences/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di/providers/general_providers/shared_preferences.dart';
import 'main/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  debugPrint("App Started");

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreference.initSharedPrefs();
  
  runApp(
    const ProviderScope(
      observers: [],
      child: App(),
    ),
  );
}
