import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../home_bookshelf/view.dart';
import '../home_explore/view.dart';
import '../home_mine/view.dart';

class HomeController extends GetxController {
  // 底部tab
  final List<BottomNavigationBarItem> tabs = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '浏览',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: '书架'),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: '我的',
    ),
  ];
  // 底部tab对应widget页面
  final List<Widget> tabsWidget = [
    const HomeExploreView(),
    const HomeBookshelfView(),
    const HomeMineView(),
  ];

  // 底部导航栏索引
  final RxInt currentTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
