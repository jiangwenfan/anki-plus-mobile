import "package:interview/providers/global_config.dart";
import 'package:logger/logger.dart';
import 'package:interview/utils/send.dart';

final logger = Logger();

Future<Map<String, dynamic>?> getNotes(String token) async {
  String url = "$baseUrl/notes";
  print("notes接口 $url ");

  final send = SendRequest(url, token: token);

  final RequestResponse requestResponse = await send.get();

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;

  if (requestStatus && rawResponse != null) {
    logger.i("notes接口 $url 创建数据[成功]! 原生响应:$rawResponse");
    // return rawResponse;
  } else {
    logger.w("notes接口 $url 创建数据[失败]! 原生响应:$rawResponse");
    // return false;
  }

  return rawResponse;
}
