// category接口的返回数据类型
typedef CategoryResponse = Map<String, CategoryModel>;

// Category接口中每个category的数据
class CategoryModel {
  final int id;
  final String name;
  final String ttype;
  final String coverUrl;
  final int count;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.ttype,
      required this.coverUrl,
      required this.count});

  // 从json创建User对象
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json["id"],
        name: json["name"],
        ttype: json["ttype"],
        coverUrl: json["coverUrl"],
        count: json["count"]);
  }
}

// 结果处理
class ResHandle {
  bool status;
  String? errorMsg;
  ResHandle({required this.status, this.errorMsg});
}

// 结果接口响应处理
class ResResponseHandle extends ResHandle {
  String? response;
  ResResponseHandle({required super.status, super.errorMsg, this.response});
}

// 接口转换处理
class ResChangeHandle extends ResHandle {
  CategoryModel? response;
  ResChangeHandle({required super.status, super.errorMsg, this.response});
}
