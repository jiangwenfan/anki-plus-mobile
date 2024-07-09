import 'package:get/get.dart';
import '../../routes.dart';
import 'view.dart';

import 'controller.dart';

// 给页面绑定控制器
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}

// 页面配置
final loginPage = GetPage(
  name: Routes.login,
  page: () => LoginView(),
  binding: LoginBinding(),
);
