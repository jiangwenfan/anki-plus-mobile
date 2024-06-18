import 'package:get/get.dart';
import '../../routes.dart';
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
  name: Routes.homeExplore,
  page: () => const HomeExploreView(),
  binding: HomeExploreBinding(),
);
