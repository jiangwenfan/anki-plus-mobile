import '../models/common.dart';
import '../models/category.dart';
import 'package:logger/logger.dart';
import 'dart:convert';
import '../config.dart';
import '../utils.dart';

final logger = Logger();

// 获取所有分类数据
Future<CategoryDataStatus> fetchCategory() async {
  const String url = "$backendHomeUrl/categories";
  logger.d("获取所有分类数据:$url");

  final send = SendRequest(url);
  final RequestResponse requestResponse = await send.get();

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;

  if (requestStatus && rawResponse != null) {
    final responseData = json.decode(rawResponse);
    logger.d("category接口获取数据[成功]! ${responseData.runtimeType} $responseData");

    if (responseData is! Map) {
      logger.w("category接口返回数据[格式错误]! 类型:${responseData.runtimeType}");
      return CategoryDataStatus(
          status: false, errorMsg: "category接口返回数据[格式错误]!");
    }

    // 将category接口中每一个value转为model
    final modelResponse = responseData.map((key, dataList) {
      // print(
      //     "---> ${key} ${key.runtimeType} ${dataList.runtimeType} ${dataList}");
      String keyString = key.toString();

      final List<CategoryModel> dataListNew1 = [];
      for (var dataItem in dataList) {
        final CategoryModel newValue = CategoryModel.fromJson(dataItem);
        dataListNew1.add(newValue);
      }
      // List<dynamic> dataList =
      // List<CategoryModel>
      // final List<CategoryModel> dataListNew1 =
      //     (dataList as List<Map<String, dynamic>>).map((dynamic dataItem) {
      //   // Map<String, dynamic> dataItem2 = dataItem as Map<String, dynamic>;
      //   // print("每一个item数据: ${dataItem.runtimeType} ${dataItem}");
      //   final CategoryModel newValue = CategoryModel.fromJson(dataItem);
      //   print("类型: ${newValue.runtimeType}");
      //   return newValue;
      // }).toList();
      print("累2:${dataListNew1.runtimeType}");

      final List<CategoryModel> dataListNew = dataListNew1;
      return MapEntry(keyString, dataListNew);
    });
    logger.i("category接口返回数据[转换model成功]");
    return CategoryDataStatus(status: true, response: modelResponse);
  } else {
    logger.w("category接口获取数据[失败]! 原生响应:$rawResponse");
    return CategoryDataStatus(
        status: requestResponse.status, errorMsg: requestResponse.errorMsg);
  }
}

// 创建分类数据
Future<bool> createCategory(Map data) async {
  const String url = "$backendHomeUrl/categories";
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
