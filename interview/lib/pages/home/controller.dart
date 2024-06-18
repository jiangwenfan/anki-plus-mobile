import 'dart:ffi';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../home_bookshelf/view.dart';
import '../home_explore/view.dart';
import '../home_mine/view.dart';
import '../../utils.dart';

class HomeController extends GetxController {
  // 标题
  final List<Text> titles = const [
    Text('浏览'),
    Text("书架"),
    Text("我的"),
  ];
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
    HomeMineView(),
  ];

  // 底部导航栏索引
  final RxInt currentTabIndex = 0.obs;

  // // 本地token的值
  // final RxnString token = RxnString(null);

  // Future getToken() async {
  //   // 获取本地登录token
  //   token.value = await getLocalToken();
  //   print("获取成功: ${token.value}");
  // }

  @override
  void onInit() {
    print("全局1.。。");
    // getToken();
    print("全局3...");
    super.onInit();
    print("全局2...");
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
