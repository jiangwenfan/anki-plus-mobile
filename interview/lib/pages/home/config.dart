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
    // Get.lazyPut<HomeController>(
    //   () => HomeController(),
    // );
    Get.lazyPut<HomeExploreController>(
      () => HomeExploreController(),
    );
    print("home绑定");
  }
}

final homePage = GetPage(
  name: Routes.home,
  page: () => const HomeView(),
  binding: HomeBinding(),
  middlewares: [HomeMiddleware()],
);
