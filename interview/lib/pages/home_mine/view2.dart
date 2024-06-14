import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
// import '../../app/pages/mine/controllers/mine_controller.dart';

// GetView<MineController>
class MineView extends GetView {
  const MineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MineView'),
          centerTitle: true,
        ),
        body: Column(children: [
          ElevatedButton(child: Text("添加分类"), onPressed: () {}),
          ElevatedButton(child: Text("添加问题"), onPressed: () {}),
        ]));
  }
}

class AddCategoryPage extends StatefulWidget {
  @override
  State<AddCategoryPage> createState() => AddCategoryPageState();
}

class AddCategoryPageState extends State<AddCategoryPage> {
  /*
  {
  "name": "string",
  "cover_url": "string",
  "ttype": "language"
}
  */
  // ttype字段的值
  String? _selectedItem;
  String? name;
  String? cover_url;

  // 下拉框的选项
  final List<String> _dropdownItems = [
    "language",
    "framework",
    "database",
    "ops"
  ];

  void createCategory(Map data) async {
    Dio dio = Dio();
    String url = "http://49.235.138.119:8080/categories";
    final response = await dio.post(url, data: data);
    print("创建分类，响应结果: ${response.data}");
  }

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
                setState(() {
                  name = value;
                });
              }),
          TextField(
              decoration: const InputDecoration(labelText: "图片url"),
              onChanged: (value) {
                setState(() {
                  cover_url = value;
                });
              }),
          DropdownButton<String>(
            value: _selectedItem,
            hint: const Text('选中技术分类'),
            items: _dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value + "类型"),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                print("选中的值:${newValue}");
                _selectedItem = newValue;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    "创建分类数据-> name:${name} ttype:${_selectedItem} ${cover_url}");
                createCategory({
                  "name": name,
                  "ttype": _selectedItem,
                  "cover_url": cover_url
                });
              },
              child: Text("提交"))
        ]));
  }
}

class AddQuestionPage extends StatefulWidget {
  @override
  State<AddQuestionPage> createState() => AddQuestionPageState();
}

class AddQuestionPageState extends State<AddQuestionPage> {
  /*
  {
  "question": "string",
  "answer": "string",
  "category_id": 0
  }
  */
  String? question;
  String? answer;
  int? category_id;

  // 原始分类数据
  Map<dynamic, dynamic> categoryOriginalData = {
    "language": [
      {
        "cover_url": "https://pic.imgdb.cn/item/666a9d7ad9c307b7e92d6c12.png",
        "name": "Python",
        "id": 1,
        "ttype": "language",
        "count": 1
      },
      {
        "cover_url": "https://pic.imgdb.cn/item/666a9d7ad9c307b7e92d6c12.png",
        "name": "Dart",
        "id": 3,
        "ttype": "language",
        "count": 0
      },
    ],
    "framework": [
      {
        "cover_url": "https://pic.imgdb.cn/item/666a9d7ad9c307b7e92d6c12.png",
        "name": "Django",
        "id": 6,
        "ttype": "framework",
        "count": 0
      },
    ],
  };

  // 处理分类数据
  List<Map<dynamic, dynamic>> categoryData(Map<dynamic, dynamic> originalData) {
    List<Map<dynamic, dynamic>> res = [];
    // 将原始数据处理为方便展示的数据
    for (var key in originalData.keys) {
      List value = originalData[key];

      for (var item in value) {
        Map<dynamic, dynamic> itemMap = {
          "id": item["id"],
          "name": item["ttype"] + item["name"]
        };
        print("itemMap:${itemMap}");
        res.add(itemMap);
      }
    }
    print("分类数据:${res}");
    return res;
  }

  void createQuestion(Map data) async {
    Dio dio = Dio();
    String url = "http://49.235.138.119:8080/questions";
    final response = await dio.post(url, data: data);
    print("创建问题,响应结果:${response.data}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("添加问题")),
        body: Column(children: [
          TextField(
              decoration: const InputDecoration(hintText: "问题描述"),
              onChanged: (value) {
                setState(() {
                  question = value;
                });
              }),
          TextField(
              decoration: const InputDecoration(hintText: "问题答案"),
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              }),
          // DropdownButton(hint: Text("选择问题分类"), items: categoryData.map(()))
        ]));
  }
}
