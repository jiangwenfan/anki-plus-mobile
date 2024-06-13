import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'routes.dart';

void main() {
  // GetMaterialApp
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: Routes.login,
    getPages: getPages,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF4F2FA),
    ),
  ));
}
