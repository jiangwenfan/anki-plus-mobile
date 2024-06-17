import '../models/common.dart';
import '../models/category.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import '../config.dart';
import '../utils.dart';

final logger = Logger();

Future<bool> createQA(Map data) async {
  String url = "http://49.235.138.119:8080/questions";
  logger.d("创建所有分类数据:$url");

  final send = SendRequest(url);

  final RequestResponse requestResponse = await send.post(data);

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;
  if (requestStatus && rawResponse != null) {
    logger.i("category接口创建数据[成功]!");
    return true;
  } else {
    logger.w("category接口创建数据[失败]! 原生响应:$rawResponse");
    return false;
  }
}
