import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/category_item.dart';
import 'controller.dart';

class HomeExploreView extends StatefulWidget {
  const HomeExploreView({super.key});

  @override
  State<HomeExploreView> createState() => HomeExploreViewState();
}

class HomeExploreViewState extends State<HomeExploreView> {
  HomeExploreController homeExploreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeExploreController.isLoading.value
        ? const CircularProgressIndicator(
            backgroundColor: Colors.green,
            valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
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
