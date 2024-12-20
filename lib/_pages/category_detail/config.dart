import 'package:get/get.dart';
import 'controller.dart';
import 'view.dart';
import '../../routers.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailController>(() => CategoryDetailController());
  }
}

final categoryDetailPage = GetPage(
    name: Routes22.categoryDetail,
    page: () => CategoryDetailView(),
    binding: CategoryDetailBinding());
