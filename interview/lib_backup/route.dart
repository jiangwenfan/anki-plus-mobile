import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/answer.dart';
// import './pages/login.dart';
import './pages/mine.dart';

// typedef PageBuilder = Widget Function(BuildContext context,
//     {dynamic arguments});

// 定义Map类型的路由表对应的页面构造器
Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(),
  "/mine": (context) => const MinePage(),
  "/answer": (context, {arguments}) => AnswerPage(arguments: arguments),
};

// 当跳转时动态生成路由
RouteFactory onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  // 页面widget的构造器函数
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    print("路由找到 ${settings.name}");
    // 当路由时:
    if (settings.arguments != null) {
      // 存在参数时，给被跳转的页面widget传递参数跳转。
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      // 不存在参数时，给被跳转页面widget不传递参数。
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  print("ERROR: 路由未找到 ${settings.name}");
};
