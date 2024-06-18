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
                  onPressed: () async {
                    // 发送登录请求,获取token
                    String token = "1212";
                    // 更新登录状态
                    bool status =
                        await controller.updateLoginStatus(true, token);
                    if (status) {
                      Get.offAndToNamed(Routes.home);
                    } else {
                      Get.snackbar("msg", "登录失败");
                    }
                  },
                  child: Text('登陆成功 ${controller.isLogin.value}')),
            )));
  }
}
