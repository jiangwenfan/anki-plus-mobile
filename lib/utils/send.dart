import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../_models/common.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

final logger = Logger();

//final res = RequestResponse(status: false, errorMsg: "服务[响应]异常，请稍后再试");
//logger.w("get请求,$url 接口[响应]异常");
// 接口请求的`响应结果`
class RequestResponse extends DataStatus {
  Map<String, dynamic>? rawResponse;
  RequestResponse({required super.status, super.errorMsg, this.rawResponse});
}

// 发送各种网络请求，处理返回结果
class SendRequest {
  final Dio dio = Dio();
  String url;

  SendRequest(this.url);

  // 发送get请求
  Future<RequestResponse> get() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      // response.data Map<String, dynamic>
      logger.i("get请求,$url 成功. ${response.data}");
      final res = RequestResponse(
          status: true,
          rawResponse: json.encode(response.data) as Map<String, dynamic>);
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
    if (response.statusCode == 201 || response.statusCode == 200) {
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

// 获取登录token
Future<String?> getLocalToken() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  logger.i("获取token成功-$token");
  return token;
}

// 写入登录token
Future<bool> writeLocalToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  try {
    prefs.setString("token", token);
    logger.i("写入token成功! ${token}");
    return true;
  } catch (e) {
    logger.e("写入token出错");
    return false;
  }
}

// 删除token
Future<void> removeLocalToken() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("token");
}

// 更新登录状态
Future<bool> updateLoginStatus(bool status, String token) async {
  // isLogin.value = status;
  // 保存token
  return await writeLocalToken(token);
}
