import 'package:get/get.dart';

import 'controller.dart';
import 'view.dart';
import '../../routes.dart';
import '../home/controller.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(
      () => MineController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

final homeMinePage = GetPage(
  name: Routes.homeMine,
  page: () => HomeMineView(),
  binding: MineBinding(),
);
