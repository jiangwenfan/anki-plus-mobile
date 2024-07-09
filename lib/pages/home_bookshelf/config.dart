import 'package:interview/pages/home/config.dart';

import 'controller.dart';
import 'view.dart';
import 'package:get/get.dart';
import '../../routes.dart';

class HomeBookshelfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBookshelfController>(
      () => HomeBookshelfController(),
    );
  }
}

final homeBookshelfPage = GetPage(
    name: Routes.homeBookshelf,
    page: () => const HomeBookshelfView(),
    binding: HomeBinding());
