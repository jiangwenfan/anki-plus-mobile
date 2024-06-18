import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('登陆页面'),
          centerTitle: true,
        ),
        body: Obx(() => Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.offAndToNamed(Routes.home);
                    // 发送登录请求,获取token
                    String token = "";
                    // 更新登录状态
                    controller.updateLoginStatus(true, token);
                  },
                  child: Text('登陆成功 ${controller.isLogin.value}')),
            )));
  }
}
