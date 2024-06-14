import 'package:get/get.dart';
import 'controller.dart';
import 'view.dart';
import '../../routes.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailController>(() => CategoryDetailController());
  }
}

final categoryDetailPage = GetPage(
    name: Routes.categoryDetail,
    page: () => CategoryDetailView(),
    binding: CategoryDetailBinding());
