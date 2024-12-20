import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';

String? tokenData;

Future main() async {
  // 读取env配置
  await dotenv.load(fileName: ".env");

  // login
  // WidgetsFlutterBinding.ensureInitialized();
  // tokenData = await getLocalToken();
  // logger.i("token: $tokenData");

  runApp(const App());
}
