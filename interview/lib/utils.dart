import 'package:dio/dio.dart';
import 'models/model.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

final logger = Logger();

class HandleRequest {
  final Dio dio = Dio();
  String url;

  HandleRequest(this.url);

  // 发送get请求
  Future<ResResponseHandle> sendGet() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      try {
        final res = ResResponseHandle(status: true, response: response.data);
        logger.i("get请求,$url 成功");
        return res;
      } catch (e) {
        final res =
            ResResponseHandle(status: false, errorMsg: "服务[响应]异常，请稍后再试");
        logger.w("get请求,$url 接口[响应]异常");
        return res;
      }
    } else {
      logger.w("get请求,$url 接口[状态]异常");
      final res = ResResponseHandle(status: false, errorMsg: "服务[状态]异常，请稍后再试");
      return res;
    }
  }
}
