import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'models/common.dart';

final logger = Logger();

// 发送各种网络请求，处理返回结果
class SendRequest {
  final Dio dio = Dio();
  String url;

  SendRequest(this.url);

  // 发送get请求
  Future<RequestResponse> get() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      try {
        final res = RequestResponse(status: true, response: response.data);
        logger.i("get请求,$url 成功");
        return res;
      } catch (e) {
        final res = RequestResponse(status: false, errorMsg: "服务[响应]异常，请稍后再试");
        logger.w("get请求,$url 接口[响应]异常");
        return res;
      }
    } else {
      logger.w("get请求,$url 接口[状态]异常");
      final res = RequestResponse(status: false, errorMsg: "服务[状态]异常，请稍后再试");
      return res;
    }
  }
}
