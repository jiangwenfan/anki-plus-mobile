import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../routes.dart';
import '../../utils.dart';
import '../home/controller.dart';

final logger = Logger();

class HomeMineView extends GetView<MineController> {
  HomeMineView({super.key});

  HomeController ex = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          child: const Text("管理中心"),
          onPressed: () {
            logger.i("跳转到管理中心");
            Get.toNamed(Routes.admin);
          }),
      ElevatedButton(
          onPressed: () async {
            // 删除token
            await removeLocalToken();
            // 重置底部索引为0
            // ex.currentTabIndex.value = 0;
            // 跳转登录
            Get.toNamed(Routes.login);

            String? t = await getLocalToken();
            print("当前token: ${t}");
          },
          child: Text("退出登录"))
    ]);
  }
}
