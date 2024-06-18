import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../home/controller.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class QAView extends StatefulWidget {
  const QAView({super.key});

  @override
  State<QAView> createState() => QAViewState();
}

class QAViewState extends State<QAView> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("hello"),
      // body: Obx(() => Stack(
      //       children: [
      //         ListView(
      //           children: [
      //             ListTile(
      //               title: Text(
      //                   '第${controller.getCurrentQuestion(controller.questionIndex.value)["id"]}题 ${controller.getCurrentQuestion(controller.questionIndex.value)["title"]}'),
      //               subtitle: Text(
      //                   '题目难度：${controller.getCurrentQuestion(controller.questionIndex.value)["difficulty"]}; 题目标签：${controller.getCurrentQuestion(controller.questionIndex.value)["tags"].join(",")}'),
      //             ),
      //             controller.isAnswered.value
      //                 ? ShowAnswer(
      //                     answer: controller.getCurrentQuestion(
      //                         controller.questionIndex.value)["answer"])
      //                 : ListTile(
      //                     title: Text('点击查看答案'),
      //                     onTap: () {
      //                       controller.isAnswered.value = true;
      //                     },
      //                   )
      //           ],
      //         ),
      //         Positioned(
      //             left: 30,
      //             bottom: 30,
      //             child: controller.isAnswered.value
      //                 ? ElevatedButton(
      //                     onPressed: () {
      //                       controller.isAnswered.value = false;

      //                       // 不能: 大于 等于
      //                       if (controller.getNextQuestionIndex() <
      //                           controller.questionList.length) {
      //                         controller.questionIndex.value++;
      //                         Get.toNamed('/question');
      //                       }
      //                     },
      //                     child: controller.getNextQuestionIndex() <
      //                             controller.questionList.length
      //                         ? const Text('下一题',
      //                             style: TextStyle(color: Colors.green))
      //                         : const Text('没有下一题',
      //                             style: TextStyle(color: Colors.grey)))
      //                 : ElevatedButton(
      //                     onPressed: () {
      //                       controller.isAnswered.value = false;
      //                       if (controller.getPrevQuestionIndex() >= 0) {
      //                         controller.questionIndex.value--;
      //                         Get.toNamed('/question');
      //                       }
      //                     },
      //                     child: controller.getPrevQuestionIndex() >= 0
      //                         ? const Text('上一题',
      //                             style: TextStyle(color: Colors.red))
      //                         : const Text('没有上一题',
      //                             style: TextStyle(color: Colors.grey))))
      //       ],
      //     )),
    );
  }
}

class ShowAnswer extends StatelessWidget {
  final String answer;
  const ShowAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: answer,
      selectable: true,
      extensionSet: md.ExtensionSet(
        md.ExtensionSet.gitHubFlavored.blockSyntaxes,
        <md.InlineSyntax>[
          md.EmojiSyntax(),
          ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
        ],
      ),
    );
  }
}
