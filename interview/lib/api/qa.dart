import '../models/common.dart';
import '../models/qa.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import '../config.dart';
import '../utils.dart';

final logger = Logger();

// 获取所有qa
Future<QADataStatus> fetchQA({int page = 1, int pageSize = 20}) async {
  final String url = "$backendHomeUrl/questions?page=$page&pageSize=$pageSize";

  final send = SendRequest(url);
  final RequestResponse requestResponse = await send.get();

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;

  if (requestStatus && rawResponse != null) {
    final nativeResponse = json.decode(rawResponse);
    logger.i("$url 接口数据解码[成功]");

    // 验证接口数据格式
    if (nativeResponse is! Map) {
      logger
          .w("qa接口数据 格式错误 类型${nativeResponse.runtimeType} 数据:$nativeResponse");
      return QADataStatus(status: false, errorMsg: "qa接口数据 格式错误");
    }

    // 类型转换
  }
}

// 创建qa
Future<bool> createQA(QAModelAdd data) async {
  String url = "$backendHomeUrl/questions";

  final send = SendRequest(url);
  final Map<String, dynamic> nativeData = data.toMap();
  final RequestResponse requestResponse = await send.post(nativeData);

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;

  if (requestStatus && rawResponse != null) {
    logger.i("qa接口 $url 创建数据[成功]! 数据:${nativeData}");
    return true;
  } else {
    logger.w("qa接口 $url 创建数据[失败]! 数据:${nativeData} 原生响应:$rawResponse");
    return false;
  }
}
