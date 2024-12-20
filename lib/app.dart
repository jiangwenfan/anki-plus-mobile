import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routers.dart';

Logger logger = Logger();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. 使用riverpod管理全局状态
    return ProviderScope(
        child: MaterialApp.router(
      routerConfig: routerConfig,
    )
        // MaterialApp(
        //   title: "Application",
        //   // initialRoute: Routes.login,
        //   // initialBinding: GlobalBinding(),
        //   // getPages: getPages,
        //   theme: ThemeData(
        //     scaffoldBackgroundColor: const Color(0xFFF4F2FA),
        //   ),
        // ),
        );
  }
}
