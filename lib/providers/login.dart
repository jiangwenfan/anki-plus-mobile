import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

// @riverpod
// Map<String, dynamic> loginState(Ref ref) {
//   return {
//     "token": "token",
//     "isLogin": false,
//   };
// }

// @riverpod
// class LoginNotifier extends _$LoginNotifier {
//   @override
//   Map<String, dynamic> build() {
//     return {
//       "token": "token",
//       "isLogin": false,
//     };
//   }

//   void updateToken(String newToken) {
//     state = {
//       ...state,
//       "token": newToken,
//     };
//   }

//   void setLogin(bool isLogin) {
//     state = {
//       ...state,
//       "isLogin": isLogin,
//     };
//   }
// }

// TODO 修改，使用这个替换上面的
@riverpod
Future<LoginNotifier> LoginNotifier(Ref ref) async {
  // // 获取当前登陆状态
  Map<String, dynamic> loginState = ref.watch(loginNotifierProvider);
  String token = loginState["token"];
  print("---note获取到的token: $loginState");

  final json = await getNotes(token);

  if (json == null) {
    // logger.w("notes接口,[失败]! 原生响应:$json");
    return LoginStatus(
      id: 0,
      title: "error",
      totalQuestions: 0,
      distinctLabels: [],
      userId: 0,
    );
  }

  // // print("---fullPath: ${state.fullPath}-----");
  // print("---loginState: $loginState-----");
  // Using package:http, we fetch a random activity from the Bored API.
  // final response = await http.get(Uri.https('boredapi.com', '/api/activity'));

  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  // final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  return LoginNotifier.fromJson(json);
}
