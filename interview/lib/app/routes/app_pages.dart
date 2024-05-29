import 'package:get/get.dart';

import '../modules/QuestionAnswer/bindings/question_answer_binding.dart';
import '../modules/QuestionAnswer/views/question_answer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/item_detail.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_ANSWER,
      page: () => const QuestionAnswerView(),
      binding: QuestionAnswerBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const ItemDetail(),
      // binding: ItemDetailBinding(),
    )
  ];
}
