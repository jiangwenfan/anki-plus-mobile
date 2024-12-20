import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login.g.dart';

@riverpod
Map<String, dynamic> loginState(Ref ref) {
  return {
    "token": "token",
    "isLogin": false,
  };
}
