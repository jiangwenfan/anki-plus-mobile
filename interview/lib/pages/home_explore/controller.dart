import 'package:get/get.dart';

class HomeExploreController extends GetxController {
  final List<Map<dynamic, dynamic>> contentList = [];

  final List<Map<dynamic, dynamic>> languageData = [];
  final List<Map<dynamic, dynamic>> frameworkData = [];
  final List<Map<dynamic, dynamic>> databaseData = [];
  final List<Map<dynamic, dynamic>> opsData = [];

  // 获取categories接口的所有数据
  void getCategoriesData(String category) async {
    String url = "http://49.235.138.119:8080/categories";

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
  void onInit() {
    super.onInit();
    // "'language', 'freamework', 'database' or 'ops'"
    getCategoriesData("language");
    getCategoriesData("freamework");
    getCategoriesData("database");
    getCategoriesData('ops');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
