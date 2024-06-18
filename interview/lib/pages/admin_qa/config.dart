import 'package:interview/pages/question_answer/view.dart';

import 'controller.dart';
import 'add_view.dart';
import '../../routes.dart';
import 'package:get/get.dart';

class AdminQABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QAViewController>(() => QAViewController());
  }
}

final adminQAPage = GetPage(
    name: Routes.adminQA, page: () => QAView(), binding: AdminQABinding());
