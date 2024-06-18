import 'package:get/get.dart';
import '../../api/categories.dart';
import '../../models/category.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class HomeExploreController extends GetxController {
  final RxMap<String, CategoryModelSet> categoryApiData =
      <String, CategoryModelSet>{}.obs;
  final RxString errorMsg = "".obs;
  final RxBool isLoading = true.obs;

  // 获取categories接口的所有数据
  void handleCategoryData() async {
    // "'language', 'freamework', 'database' or 'ops'"
    final CategoryDataStatus res = await fetchCategory();

    isLoading.value = res.status;

    if (!res.status) {
      print("-->${res.errorMsg}");
      errorMsg.value = res.errorMsg as String;
      logger.i("响应状态异常!已修改");
      // 修改加载状态
      isLoading.value = false;
    } else {
      categoryApiData.value = res.response as Map<String, CategoryModelSet>;
      logger.i("获取成功");
      // 修改加载状态
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // 获取处理接口数据
    handleCategoryData();
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
