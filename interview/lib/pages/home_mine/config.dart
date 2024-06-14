import 'package:get/get.dart';

import 'controller.dart';
import 'view.dart';
import '../../routes.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(
      () => MineController(),
    );
  }
}

final homeMinePage = GetPage(
  name: Routes.homeMine,
  page: () => const HomeMineView(),
  binding: MineBinding(),
);
