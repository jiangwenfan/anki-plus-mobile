import 'package:get/get.dart';

// import 'modules/QuestionAnswer/bindings/question_answer_binding.dart';
// import 'modules/QuestionAnswer/views/question_answer_view.dart';
import 'pages/home/config.dart';
import 'pages/question_answer/question_page.dart';
import 'pages/category_detail/item_detail.dart';
import 'pages/login/config.dart';
import 'pages/home_mine/config.dart';

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
  loginPage,
  homePage,
  homeMinePage,

  // GetPage(
  //   name: Routes.questionAnswer,
  //   page: () => const QuestionAnswerView(),
  //   binding: QuestionAnswerBinding(),
  // ),
  // GetPage(
  //   name: Routes.detail,
  //   page: () => const ItemDetail(),
  //   binding: HomeBinding(),
  // ),
  // GetPage(
  //     name: Routes.question,
  //     page: () => const QuestionPage(),
  //     binding: HomeBinding())
];
