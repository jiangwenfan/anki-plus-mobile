import 'package:flutter/material.dart';
import 'pages/home/config.dart';
import 'package:get/get.dart';
import 'pages/home/controller.dart';
import 'utils.dart';

import 'routes.dart';

String? tokenData = null;

void main() async {
  // Get.put<HomeController>(HomeController());
  // GetMaterialApp
  WidgetsFlutterBinding.ensureInitialized();
  tokenData = await getLocalToken();
  print("main函数中: $tokenData");
  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: Routes.home,
    initialBinding: GlobalBinding(),
    getPages: getPages,
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFFF4F2FA),
    ),
  ));
}
