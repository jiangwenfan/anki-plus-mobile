import 'package:get/get.dart';
import 'controller.dart';
import 'add_view.dart';
import '../../routes.dart';

class AdminCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCategoryController>(() => AdminCategoryController());
  }
}

final adminCategoryPage = GetPage(
    name: Routes.adminCategory,
    page: () => AddCategoryView(),
    binding: AdminCategoryBinding());
