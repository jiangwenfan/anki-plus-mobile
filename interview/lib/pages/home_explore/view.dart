import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/category_item.dart';

class HomeExploreView extends StatefulWidget {
  const HomeExploreView({super.key});

  @override
  State<HomeExploreView> createState() => HomeExploreViewState();
}

class HomeExploreViewState extends State<HomeExploreView> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      CItem(
        title: "语言",
        contentWidget: BlockCategoryContent(contentList: languageData),
      ),
      CItem(
        title: "框架",
        contentWidget: BlockCategoryContent(contentList: frameworkData),
      ),
      CItem(
        title: "数据库",
        contentWidget: BlockCategoryContent(contentList: contentList),
      ),
      CItem(
        title: "其他",
        contentWidget: BlockCategoryContent(contentList: contentList),
      )
    ]);
  }
}
