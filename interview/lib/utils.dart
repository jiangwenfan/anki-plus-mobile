import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'models/common.dart';

final logger = Logger();

//final res = RequestResponse(status: false, errorMsg: "服务[响应]异常，请稍后再试");
//logger.w("get请求,$url 接口[响应]异常");

// 发送各种网络请求，处理返回结果
class SendRequest {
  final Dio dio = Dio();
  String url;

  SendRequest(this.url);

  // 发送get请求
  Future<RequestResponse> get() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      logger.i("get请求,$url 成功");
      final res = RequestResponse(status: true, rawResponse: response.data);
      return res;
    } else {
      logger.w("get请求,$url 接口[状态]异常");
      final res = RequestResponse(status: false, errorMsg: "服务[状态]异常，请稍后再试");
      return res;
    }
  }

  // 发送post请求
  Future<RequestResponse> post(dynamic data) async {
    final response = await dio.post(url, data: data);
    if (response.statusCode == 201) {
      logger.i("post请求,$url 成功");
      final res = RequestResponse(status: true, rawResponse: response.data);
      return res;
    } else {
      logger.w("post请求,$url 接口[状态]异常");
      final res = RequestResponse(status: false, errorMsg: "服务[状态]异常，请稍后再试");
      return res;
    }
  }
}
