import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'note.dart';
import '../../providers/login.dart';
import '../features/home/data/api.dart';

part 'notep.g.dart';
// noteProvider

@riverpod
Future<Note> notep(Ref ref) async {
  // // 获取当前登陆状态
  Map<String, dynamic> loginState = ref.watch(loginNotifierProvider);
  String token = loginState["token"];
  print("---note获取到的token: $loginState");

  final json = await getNotes(token);

  if (json == null) {
    logger.w("notes接口,[失败]! 原生响应:$json");
    return Note(
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
  return Note.fromJson(json);
}
