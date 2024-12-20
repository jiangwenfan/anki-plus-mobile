import 'package:interview/_pages/question_answer/view.dart';

import 'controller.dart';
import 'add_view.dart';
import '../../routers.dart';
import 'package:get/get.dart';

class AdminQABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QAViewController>(() => QAViewController());
  }
}

final adminQAPage = GetPage(
    name: Routes22.adminQA, page: () => QAView(), binding: AdminQABinding());
