import 'package:get/get.dart';
import '../../routers.dart';
import 'controller.dart';
import 'view.dart';

class HomeExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeExploreController>(
      () => HomeExploreController(),
    );
    print("绑定成功了");
  }
}

final homeExplorePage = GetPage(
  name: Routes22.homeExplore,
  page: () => const HomeExploreView(),
  binding: HomeExploreBinding(),
);
