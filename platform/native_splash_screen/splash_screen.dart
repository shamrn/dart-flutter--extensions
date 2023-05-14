// The file contains functionality for splash screen

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:TODO/common/app_constants/app_settings.dart';

void runSplashScreen() async {
  // Run and duration the native splash screen

  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  await Future<dynamic>.delayed(AppSettings.splashScreenDuration);

  FlutterNativeSplash.remove();
}
