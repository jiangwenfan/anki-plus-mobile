import 'package:get/get.dart';

// import 'modules/QuestionAnswer/bindings/question_answer_binding.dart';
// import 'modules/QuestionAnswer/views/question_answer_view.dart';
import 'pages/home/bindings/home_binding.dart';
import 'pages/home/views/home_view.dart';
import 'pages/question_answer/question_page.dart';
import 'pages/category_detail/item_detail.dart';
import 'pages/login/binding.dart';
import 'pages/login/view.dart';
import 'pages/home_mine/bindings/mine_binding.dart';
import 'pages/home_mine/views/mine_view.dart';

// 路由名称和实际路径
abstract class Routes {
  Routes._();
  static const home = '/home';
  static const login = '/login';
  static const mine = '/mine';
  static const questionAnswer = '/question-answer';
  static const detail = '/detail';
  static const question = '/question';
}

// 页面路由配置
final getPages = [
  GetPage(
    name: Routes.home,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginView(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.mine,
    page: () => const MineView(),
    binding: MineBinding(),
  ),
  // GetPage(
  //   name: Routes.questionAnswer,
  //   page: () => const QuestionAnswerView(),
  //   binding: QuestionAnswerBinding(),
  // ),
  GetPage(
    name: Routes.detail,
    page: () => const ItemDetail(),
    binding: HomeBinding(),
  ),
  GetPage(
      name: Routes.question,
      page: () => const QuestionPage(),
      binding: HomeBinding())
];
