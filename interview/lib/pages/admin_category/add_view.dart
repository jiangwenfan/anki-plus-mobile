import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class AddCategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCategoryViewState();
  }
}

class AddCategoryViewState extends State<AddCategoryView> {
  AdminCategoryController controller = Get.find();

  // 将item字符串处理为item组件
  List<DropdownMenuItem<String>> genDropdownMenuItem(
      List<String> dropdownItems) {
    final res = dropdownItems.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value + "类型"),
      );
    }).toList();
    return res;
  }

  // 发送请求，创建数据
  void createCategory() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("添加分类")),
        body: Column(children: [
          TextField(
              decoration: const InputDecoration(
                labelText: '技术名称',
              ),
              onChanged: (value) {
                controller.name.value = value;
              }),
          TextField(
              decoration: const InputDecoration(labelText: "图片url"),
              onChanged: (value) {
                controller.coverUrl.value = value;
              }),
          DropdownButton<String>(
            value: controller.currentCategoryType.value,
            hint: const Text('选中技术分类'),
            items: genDropdownMenuItem(controller.dropdownItems),
            onChanged: (String? newValue) {
              controller.currentCategoryType.value = newValue!;
            },
          ),
          ElevatedButton(
              onPressed: () {
                createCategory();
              },
              child: Text("提交"))
        ]));
  }
}
