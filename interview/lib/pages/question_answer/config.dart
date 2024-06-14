import 'package:get/get.dart';
import 'controller.dart';
import 'view.dart';
import '../../routes.dart';

class QABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QAController>(() => QAController());
  }
}

final qaPage =
    GetPage(name: Routes.qa, page: () => QAView(), binding: QABinding());
