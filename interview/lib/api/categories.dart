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

  final send = SendRequest(url);
  final RequestResponse requestResponse = await send.get();

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;

  // 请求状态成功 and 响应不为空时，请求成功
  if (requestStatus && rawResponse != null) {
    final nativeResponse = json.decode(rawResponse);
    logger.i("$url 接口数据解码[成功]! ");

    // 接口数据格式错误时
    if (nativeResponse is! Map) {
      logger.w(
          "category接口返回数据[格式错误]! 类型:${nativeResponse.runtimeType} 数据: $nativeResponse");
      return CategoryDataStatus(
          status: false, errorMsg: "category接口返回数据[格式错误]!");
    }

    /*
    将 {"name":[Map]} --转换为-->  {"name":List[CategoryModel]}
    */
    final modelResponse = nativeResponse.map((bigCategoryName, categoryList) {
      // 转换类型
      String bigCategory = bigCategoryName.toString();

      // 将categoryList转为List<CategoryModel>
      final List<CategoryModel> categorySet = [];
      for (var categoryItem in categoryList) {
        final CategoryModel categoryModel =
            CategoryModel.fromJson(categoryItem);
        categorySet.add(categoryModel);
      }

      return MapEntry(bigCategory, categorySet);
    });

    logger.i("category接口数据[转换model成功]");
    return CategoryDataStatus(status: true, response: modelResponse);
  } else {
    logger.w("category接口数据[失败]! 原生响应:$rawResponse");
    return CategoryDataStatus(
        status: requestResponse.status, errorMsg: requestResponse.errorMsg);
  }
}

// 创建分类数据
Future<bool> createCategory(Map data) async {
  const String url = "$backendHomeUrl/categories";

  final send = SendRequest(url);
  final RequestResponse requestResponse = await send.post(data);

  final rawResponse = requestResponse.rawResponse;
  final requestStatus = requestResponse.status;

  // 请求状态成功 and 响应不为空时，请求成功
  if (requestStatus && rawResponse != null) {
    logger.i("category接口 $url 创建数据[成功]! 数据:$data");
    return true;
  } else {
    logger.w("category接口 $url 创建数据[失败]! 数据:$data 原生响应:$rawResponse");
    return false;
  }
}
