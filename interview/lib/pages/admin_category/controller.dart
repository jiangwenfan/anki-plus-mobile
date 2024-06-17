import 'package:get/get.dart';

class AdminCategoryController extends GetxController {
  RxString name = "".obs;
  RxString coverUrl = "".obs;
  RxString ttype = "".obs;
  // 当前技术分类所属顶层类型
  RxString currentCategoryType = "".obs;

  // 下拉框的选项
  final List<String> dropdownItems = [
    "language",
    "framework",
    "database",
    "ops"
  ];

  @override
  void onInit() {
    super.onInit();
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
