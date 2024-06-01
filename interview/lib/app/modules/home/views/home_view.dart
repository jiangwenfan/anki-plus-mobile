import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:interview/app/modules/home/views/home_page.dart';
import './bookshelf_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Widget> bodyWidget = [
    const HomePage(),
    const BookshelfPage(),
    const Text('Mine'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        // #f3f2f6
        backgroundColor: const Color(0xFFF3F2F6),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentTabIndex.value,
          onTap: (index) {
            controller.currentTabIndex.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Mine',
            ),
          ],
        ),
      ),
      body: Obx(() => bodyWidget[controller.currentTabIndex.value]),
    );
  }
}
