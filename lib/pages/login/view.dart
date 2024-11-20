import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  // LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('登陆'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // 手机+密码/验证码登录
            TextField(
              onChanged: (value) {
                setState(() {});
              },
            ),

            // 第三方登录,流式布局，每行显示3个
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.login_outlined, size: 80),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home_filled, size: 80))
              ],
            ),
          ],
        ));
  }
}
/*
ElevatedButton(
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
                  child: Text('登陆成功 ${controller.isLogin.value}'))
*/