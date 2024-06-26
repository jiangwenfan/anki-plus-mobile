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

  // admin所需的数据
  final RxList<ListCategoryModel> listCategoryData = <ListCategoryModel>[].obs;

  // 获取categories接口的所有数据
  Future<void> handleCategoryData() async {
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

      // [admin]将数据处理为管理页面数据
      for (var item in categoryApiData.entries) {
        String bigCategory = item.key;
        CategoryModelSet categoryModelSet = item.value;
        for (var ele in categoryModelSet) {
          ListCategoryModel data =
              ListCategoryModel(categoryModel: ele, bigCategory: bigCategory);
          listCategoryData.add(data);
        }
      }
      // List<String> keys = _homeExploreController.categoryApiData.keys.toList();
      // String bigCategory = keys[index];
      // CategoryModel d = _homeExploreController
      //     .categoryApiData[bigCategory]![index];
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

  // admin页面用来删除指定索引category数据
  void deleteAdminCategoryData(int index) {
    int category_id = listCategoryData[index].categoryModel.id;
    listCategoryData.removeAt(index);
    // 发送
    logger.w("删除id是${category_id}的分类数据");
  }
}
