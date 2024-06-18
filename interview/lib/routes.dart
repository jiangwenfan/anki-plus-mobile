import 'pages/login/config.dart';

import 'pages/home/config.dart';
import 'pages/home_explore/config.dart';
import 'package:interview/pages/home_bookshelf/config.dart';
import 'pages/home_mine/config.dart';
import 'pages/admin/config.dart';
import 'pages/admin_category/config.dart';
import 'pages/admin_qa/config.dart';

import 'pages/question_answer/config.dart';
import 'pages/category_detail/config.dart';

// 路由名称和实际路径
abstract class Routes {
  Routes._();

  static const login = '/login';
  // home底部导航栏
  static const home = '/home';
  static const homeExplore = '/explore';
  static const homeBookshelf = '/bookshelf';
  static const homeMine = '/mine';
  // 其他
  static const qa = '/qa';
  static const categoryDetail = '/detail';
  // admin
  static const admin = "/admin";
  static const adminCategory = "/adminCategory";
  static const adminQA = "/qa";
}

// 页面路由配置
final getPages = [
  loginPage,
  // home
  homePage,
  homeExplorePage,
  homeBookshelfPage,
  homeMinePage,
  // 其他
  qaPage,
  categoryDetailPage,
  // admin
  adminPage,
  adminCategoryPage,
  adminQAPage,
];
