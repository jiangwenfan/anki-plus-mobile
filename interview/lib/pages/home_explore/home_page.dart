import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Map<dynamic, dynamic>> contentList = [
    {
      "title": "python",
      "count": 100,
      "coverUrl":
          "https://www.kasandbox.org/programming-images/avatars/cs-hopper-happy.png",
      "contentList": [
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
      ]
    },
    {
      "title": "javascript",
      "count": 900,
      "coverUrl":
          "https://www.kasandbox.org/programming-images/avatars/cs-hopper-happy.png",
      "contentList": [
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
      ]
    },
    {
      "title": "ts",
      "count": 200,
      "coverUrl":
          "https://www.kasandbox.org/programming-images/avatars/cs-hopper-happy.png",
      "contentList": [
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
      ]
    },
    {
      "title": "dart",
      "count": 300,
      "coverUrl":
          "https://www.kasandbox.org/programming-images/avatars/cs-hopper-happy.png",
      "contentList": [
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
        {"requestion": "问题11111"},
      ]
    },
  ];

  final List<Map<dynamic, dynamic>> languageData = [];
  final List<Map<dynamic, dynamic>> frameworkData = [];
  final List<Map<dynamic, dynamic>> databaseData = [];
  final List<Map<dynamic, dynamic>> opsData = [];

  // 获取categories接口的所有数据
  void getCategoriesData(String category) async {
    // String url = "https://host.open-language.space/categories";
    String url = "http://49.235.138.119:8080/categories?ttype=${category}";

    Dio dio = Dio();

    final response = await dio.get(url);
    Map<String, dynamic> responseData = response.data;
    print("${category} 分类数据:${response.data}");

    // 将List<dynamic>转为List<Map<dynamic, dynamic>>
    List<Map<dynamic, dynamic>>? res = [];
    for (var e in responseData[category]) {
      res.add({
        "id": e["id"],
        "name": e["name"],
        "ttype": e["ttype"],
        "coverUrl": e["coverUrl"],
        "count": e["count"]
      });
    }
    print(
        "--> res:${res.runtimeType},---> ${responseData[category].runtimeType}");

    switch (category) {
      case "language":
        setState(() {
          languageData.addAll(res);
        });

        print(languageData);
        break;
      case "freamework":
        setState(() {
          frameworkData.addAll(res);
        });
        break;
      case "database":
        setState(() {
          databaseData.addAll(res);
        });
        break;
      case "ops":
        setState(() {
          opsData.addAll(res);
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    // "'language', 'freamework', 'database' or 'ops'"
    getCategoriesData("language");
    getCategoriesData("freamework");
    getCategoriesData("database");
    getCategoriesData('ops');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      BlockCategory(
        title: "语言",
        contentWidget: BlockCategoryContent(contentList: languageData),
      ),
      BlockCategory(
        title: "框架",
        contentWidget: BlockCategoryContent(contentList: frameworkData),
      ),
      BlockCategory(
        title: "数据库",
        contentWidget: BlockCategoryContent(contentList: contentList),
      ),
      BlockCategory(
        title: "其他",
        contentWidget: BlockCategoryContent(contentList: contentList),
      )
    ]);
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

// 每个区域块中的子类显示区域
class BlockCategoryContent extends StatefulWidget {
  final List<Map> contentList;

  const BlockCategoryContent({super.key, required this.contentList});

  @override
  State<BlockCategoryContent> createState() => BlockCategoryContentState();
}

class BlockCategoryContentState extends State<BlockCategoryContent> {
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

// 每个分类的内容区域块
class BlockCategory extends StatefulWidget {
  final String title;
  final Widget contentWidget;
  const BlockCategory(
      {super.key,
      required String this.title,
      required Widget this.contentWidget});

  @override
  State<BlockCategory> createState() => BlockCategoryState();
}

class BlockCategoryState extends State<BlockCategory> {
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
