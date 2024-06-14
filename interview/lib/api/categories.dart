// 处理category接口
class HandleCategoryAPi {
  Future<ResChangeHandle> handleGet() async {
    String url = "";
    final h = HandleRequest(url);

    final ResResponseHandle resData = await h.sendGet();
    final responseData = resData.response;

    if (resData.status && responseData != null) {
      final response = json.decode(responseData);

      // 将category接口中每一个value转为model
      final res = response.map((key, value) {
        final newValue = CategoryModel.fromJson(value);
        return MapEntry(key, newValue);
      });
      logger.i("转换model $url 成功");
      return res;
    } else {
      return ResChangeHandle(
          status: resData.status, errorMsg: resData.errorMsg);
    }
  }
}
