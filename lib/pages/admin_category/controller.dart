import 'package:get/get.dart';

class AdminCategoryController extends GetxController {
  RxnString name = RxnString(null);
  // RxString? name = "".obs;
  RxnString coverUrl = RxnString(null);
  // RxString? coverUrl = "".obs;
  RxnString ttype = RxnString(null);
  // RxString? ttype = "".obs;
  // 当前技术分类所属顶层类型
  RxnString currentCategoryType = RxnString(null);

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
