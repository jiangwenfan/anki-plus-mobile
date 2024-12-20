import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:interview/_pages/admin_qa/controller.dart';
import 'package:interview/_pages/question_answer/controller.dart';

class AddQAView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddQAViewState();
  }
}

class AddQAViewState extends State<AddQAView> {
  QAViewController controller = Get.find();

  void createQuestion(Map data) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("添加问题")),
        body: Column(children: [
          TextField(
              decoration: const InputDecoration(hintText: "问题描述"),
              onChanged: (value) {
                controller.question.value = value;
              }),
          TextField(
              decoration: const InputDecoration(hintText: "问题答案"),
              onChanged: (value) {
                controller.question.value = value;
              }),
          // DropdownButton(hint: Text("选择问题分类"), items: categoryData.map(()))
        ]));
  }
}
