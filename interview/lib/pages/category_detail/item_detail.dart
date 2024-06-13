import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:interview/pages/home/controllers/home_controller.dart';

// 技术分类的详情页面
class ItemDetail extends StatefulWidget {
  const ItemDetail({super.key});

  @override
  State<ItemDetail> createState() => ItemDetailState();
}

class ItemDetailState extends State<ItemDetail> {
  HomeController homeController = Get.find<HomeController>();

  List<Widget> generate_item(List<Map> titleList) {
    // 显示单条面试题目
    return titleList
        .map((e) => ListTile(
              title: Text(e["requestion"]),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final Map<dynamic, dynamic> args = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(args['title'] ?? "hello"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Text("题库数量:${args["count"] ?? 10}"),
                ListTile(
                  title: Text(args["title"]),
                  leading: Image.network(
                    args["coverUrl"] ??
                        "https://www.kasandbox.org/programming-images/avatars/cs-hopper-happy.png",
                    width: 90,
                    height: 90,
                  ),
                ),
                // Text(args["contentList"]),
                // 题库内容显示
                ListTile(
                  title: Text("题目列表"),
                ),
                ListTile(
                  title: Text("题目列表"),
                ),
                // generate_item(args["contentList"])
              ],
            ),
            Positioned(
                left: 10,
                bottom: 10,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("加入题架")),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed("/question",
                                arguments: {"questionIndex": 0});
                          },
                          child: Text("开始学习")),
                    ),
                  ],
                )),
          ],
        ));
  }
}
