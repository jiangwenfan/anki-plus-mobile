import 'package:flutter/material.dart';
import '../../routes.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登陆'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.home);
            },
            child: Text('登陆成功')),
      ),
    );
  }
}
