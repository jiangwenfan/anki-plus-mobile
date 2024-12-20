import 'package:interview/_pages/home/config.dart';

import 'controller.dart';
import 'view.dart';
import 'package:get/get.dart';
import '../../routers.dart';

class HomeBookshelfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBookshelfController>(
      () => HomeBookshelfController(),
    );
  }
}

final homeBookshelfPage = GetPage(
    name: Routes22.homeBookshelf,
    page: () => const HomeBookshelfView(),
    binding: HomeBinding());
