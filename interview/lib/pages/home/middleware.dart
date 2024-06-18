import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import '../../routes.dart';
import 'controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class HomeMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // 这里的route就是 路由路径 /home

    // final HomeController controller = Get.find<HomeController>();

    // 读取登录状态，判断是否登录成功
    // String? tokenData = controller.token.value;

    if (tokenData == null) {
      print("没有登录 $tokenData");
      // 如果 token 为空，重定向到登录页面
      return RouteSettings(name: Routes.login);
    }
    return null;
  }
}
