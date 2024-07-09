import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/category_item.dart';
import 'controller.dart';
import '../../common_widgets.dart';

class HomeExploreView extends StatefulWidget {
  const HomeExploreView({super.key});

  @override
  State<HomeExploreView> createState() => HomeExploreViewState();
}

class HomeExploreViewState extends State<HomeExploreView> {
  HomeExploreController homeExploreController =
      Get.find<HomeExploreController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeExploreController.isLoading.value
        ? const CircularIndicator()
        : ListView.builder(
            itemBuilder: (context, index) {
              // 修改状态为加载完成
              //homeExploreController.isLoading.value = false;

              List<String> keys =
                  homeExploreController.categoryApiData.keys.toList();
              String title = keys[index];
              return CItem(
                title: title,
                contentWidget: CItemContent(
                    contentList: homeExploreController.categoryApiData[title]!),
              );
            },
            itemCount: homeExploreController.categoryApiData.length));
  }
}
