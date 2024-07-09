import 'package:get/get.dart';
import '../../routes.dart';
import 'controller.dart';
import 'view.dart';
import '../home_explore/controller.dart';
import 'middleware.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeExploreController>(
      () => HomeExploreController(),
    );
  }
}

final homePage = GetPage(
  name: Routes.home,
  page: () => HomeView(),
  binding: HomeBinding(),
  middlewares: [HomeMiddleware()],
);
