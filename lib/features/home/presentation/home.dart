import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Note(title: "11", desc: "22", noteId: index);
        },
        itemCount: 20,
      ),
    );
  }
}

// note
class Note extends HookConsumerWidget {
  final String title;
  final String desc;
  final int noteId;
  const Note(
      {super.key,
      required this.title,
      required this.desc,
      required this.noteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: ListTile(
        title: Text(title),
        subtitle: Text(title),
        onTap: () {
          logger.i("Note $noteId clicked");
        },
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromRGBO(255, 255, 255, 1)),
    );
  }
}
