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

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  Map<String, dynamic> build() {
    return {
      "token": "token",
      "isLogin": false,
    };
  }

  void updateToken(String newToken) {
    state = {
      ...state,
      "token": newToken,
    };
  }

  void setLogin(bool isLogin) {
    state = {
      ...state,
      "isLogin": isLogin,
    };
  }
}
