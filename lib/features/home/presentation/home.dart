import 'package:flutter/material.dart';

import 'package:logger/logger.dart';

final logger = Logger();

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Obx(() => controller.titles[controller.currentTabIndex.value]),
        title: const Text("Home"),
        centerTitle: true,
        // #f3f2f6
        backgroundColor: const Color(0xFFF3F2F6),
      ),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     currentIndex: controller.currentTabIndex.value,
      //     onTap: (index) {
      //       controller.currentTabIndex.value = index;
      //       logger.i("底部tab被点击,索引:$index");
      //     },
      //     items: controller.tabs,
      //   ),
      // ),
      // body: Obx(() => controller.tabsWidget[controller.currentTabIndex.value]),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
