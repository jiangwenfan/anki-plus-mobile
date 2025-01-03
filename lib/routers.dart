// import '_pages/login/config.dart';

// import '_pages/home/config.dart';
// import '_pages/home_explore/config.dart';
// import 'package:interview/_pages/home_bookshelf/config.dart';
// import '_pages/home_mine/config.dart';
// import '_pages/admin/config.dart';
// import '_pages/admin_category/config.dart';
// import '_pages/admin_qa/config.dart';

// import '_pages/question_answer/config.dart';
// import '_pages/category_detail/config.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/features/feature.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:interview/providers/login.dart';

// 使用 Riverpod 容器访问全局变量
// final container = ProviderContainer();

// 模拟登录状态 Provider
// final isLoggedInProvider = StateProvider<bool>((ref) => false);

// // 路由名称和实际路径
// abstract class Routes22 {
//   Routes22._();

//   static const login = '/login';
//   // home底部导航栏
//   static const home = '/home';
//   static const homeExplore = '/explore';
//   static const homeBookshelf = '/bookshelf';
//   static const homeMine = '/mine';
//   // 其他
//   static const qa = '/qa';
//   static const categoryDetail = '/detail';
//   // admin
//   static const admin = "/admin";
//   static const adminAddCategory = "/adminAddCategory";
//   static const adminCategory = "/adminCategory";
//   static const adminQA = "/qa";
// }

// // 页面路由配置
// final _getPages = [
//   loginPage,
//   // home
//   homePage,
//   homeExplorePage,
//   homeBookshelfPage,
//   homeMinePage,
//   // 其他
//   qaPage,
//   categoryDetailPage,
//   // admin
//   adminPage,
//   adminCategoryPage,
//   adminAddCategoryPage,
//   adminQAPage,
// ];

final GoRouter routerConfig = GoRouter(
  routes: routes,
  initialLocation: '/home',
  redirect: (BuildContext context, GoRouterState state) {
    //  获取全局的 ProviderContainer
    final container = ProviderScope.containerOf(context);
    // 获取当前登陆状态
    Map<String, dynamic> loginState = container.read(loginNotifierProvider);

    // print("---fullPath: ${state.fullPath}-----");
    print("---loginState: $loginState-----");

    // 如果未登录且不是在 /login_home，跳转到 /login_home
    if (!loginState["isLogin"] && state.fullPath != '/login_home') {
      return "/login_home";
    }
    // 已登录 保持当前路径
    return null;
  },
);

// 路由路径配置
final routes = [
  ...authRoutes,
  ...homeRoutes,
];
