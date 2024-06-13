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
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.home);
            },
            child: const Text('登陆成功')),
      ),
    );
  }
}
