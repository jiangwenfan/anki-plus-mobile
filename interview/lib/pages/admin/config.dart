import 'package:get/get.dart';
import 'package:interview/pages/home/config.dart';
import 'controller.dart';
import 'view.dart';
import '../../routes.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }
}

final adminPage = GetPage(
    name: Routes.admin, page: () => AdminView(), binding: HomeBinding());
