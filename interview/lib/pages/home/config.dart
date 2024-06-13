import 'package:get/get.dart';
import '../../routes.dart';
import 'controller.dart';
import 'view.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

final homePage = GetPage(
  name: Routes.home,
  page: () => HomeView(),
  binding: HomeBinding(),
);
