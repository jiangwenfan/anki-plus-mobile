import 'package:get/get.dart';
import '../../routers.dart';
import 'controller.dart';
import '../../features/home/presentation/home.dart';
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
  name: Routes22.home,
  page: () => Home(),
  binding: HomeBinding(),
  middlewares: [HomeMiddleware()],
);
