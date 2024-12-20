import 'package:get/get.dart';
import 'package:interview/_pages/home/config.dart';
import 'controller.dart';
import 'view.dart';
import '../../routers.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }
}

final adminPage = GetPage(
    name: Routes22.admin, page: () => AdminView(), binding: HomeBinding());
