// The file contains classes for system ui

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:TODO/common/app_constants/app_colors.dart';

void setSystemUi() {
  // Sets the system UI settings

  WidgetsFlutterBinding.ensureInitialized();

  // Set the color for the status bar and the navigation bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.canvasColor,
    systemNavigationBarColor: AppColors.canvasColor,
  ));

  // Specifies the set of orientations the application interface can be displayed in
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
