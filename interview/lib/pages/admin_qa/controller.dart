import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class QAViewController extends GetxController {
  RxString question = "".obs;
  RxString answer = "".obs;
  RxInt categoryId = 0.obs;

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
}
