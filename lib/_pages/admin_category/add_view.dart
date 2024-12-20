import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/utils/send.dart';
import 'controller.dart';

class AddCategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCategoryViewState();
  }
}

class AddCategoryViewState extends State<AddCategoryView> {
  AdminCategoryController controller = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

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
  Future<bool> createCategory() async {
    Map data = {
      "name": controller.name.value,
      "cover_url": controller.coverUrl.value,
      "ttype": controller.ttype.value,
      "t": controller.currentCategoryType.value
    };
    print("创建提交的数据: ${data}");
    if (controller.name.value == null ||
        controller.coverUrl.value == null ||
        controller.currentCategoryType.value == null) {
      // Get.snackbar("验证错误", "必须输入值");
      Get.dialog(Center(
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(color: Colors.green),
          child: Text("不能为空"),
        ),
      ));
      return false;
    } else {
      logger.i("提交成功");
      // 清空输入的值
      controller.currentCategoryType.value = null;
      _nameController.clear();
      _urlController.clear();
      Get.snackbar("提交成功", "👌");
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("添加分类")),
        body: Column(children: [
          TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '技术名称',
              ),
              onChanged: (value) {
                controller.name.value = value;
              }),
          TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: "图片url"),
              onChanged: (value) {
                controller.coverUrl.value = value;
              }),
          Obx(() => DropdownButton<String>(
                value: controller.currentCategoryType.value,
                hint: const Text('选中技术分类'),
                items: genDropdownMenuItem(controller.dropdownItems),
                onChanged: (String? newValue) {
                  controller.currentCategoryType.value = newValue!;
                },
              )),
          ElevatedButton(
              onPressed: () async {
                await createCategory();
                // controller.name.value == null;
              },
              child: Text("提交"))
        ]));
  }
}
