import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psc_app/app/core/services/firebase/firebase_core_service.dart';

import 'package:psc_app/injection.dart';

class AppInitializer {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await GetStorage.init();
    await FirebaseCoreService.init();

    await Injection.init();
  }
}
