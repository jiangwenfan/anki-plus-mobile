import 'package:get/get.dart';
import 'package:flutter/material.dart';

// explore页面由多个categoryItem widget组成。
class CItem extends StatefulWidget {
  final String title;
  final Widget contentWidget;
  const CItem(
      {super.key,
      required String this.title,
      required Widget this.contentWidget});

  @override
  State<CItem> createState() => CItemState();
}

class CItemState extends State<CItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          widget.contentWidget,
        ],
      ),
    );
  }
}

// 每个categoryItem widget由多个catgeoryItemContent 组成
class CItemContent extends StatefulWidget {
  final List<Map> contentList;

  const CItemContent({super.key, required this.contentList});

  @override
  State<CItemContent> createState() => CItemContentState();
}

class CItemContentState extends State<CItemContent> {
  List<Widget> generateContentCard() {
    return widget.contentList
        .map((e) => ItemCard(
              Item: e,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: ListView(
          scrollDirection: Axis.horizontal, children: generateContentCard()),
    );
  }
}

// 每个子类的显示卡片
class ItemCard extends StatefulWidget {
  final Map Item;

  const ItemCard({super.key, required this.Item});

  @override
  State<ItemCard> createState() => ItemCardState();
}

class ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      // #ffffff
      color: const Color(0xFFFFFFFF),
      // color: Colors.white,
      margin: EdgeInsets.all(10),

      child: InkWell(
        onTap: () {
          Get.toNamed('/detail', arguments: widget.Item);
        },
        child: Container(
          height: 150,
          width: 150,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.Item['title'],
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 100,
                  height: 100,
                  // decoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.circular(10),
                  //     color: Colors.green),
                  child: Image.network(widget.Item['coverUrl']),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
