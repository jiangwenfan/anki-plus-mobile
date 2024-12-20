import 'package:get/get.dart';
import 'controller.dart';
import 'view.dart';
import '../../routers.dart';

class QABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QAController>(() => QAController());
  }
}

final qaPage =
    GetPage(name: Routes22.qa, page: () => QAView(), binding: QABinding());
