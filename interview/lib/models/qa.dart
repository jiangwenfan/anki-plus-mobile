import 'common.dart';

// qa
class QAModel {
  final int id;
  final int categoryId;
  final String title;
  final String answer;

  QAModel(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.answer});

  factory QAModel.fromJson(Map<String, dynamic> json) {
    return QAModel(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        answer: json["answer"]);
  }
}

// add qa
class QAModelAdd {
  final int categoryId;
  final String question;
  final String answer;

  QAModelAdd(
      {required this.categoryId, required this.question, required this.answer});

  // 将对象转为Map
  Map<String, dynamic> toMap() {
    return {"category_id": categoryId, "question": question, "answer": answer};
  }
}

typedef QAModelSet = List<QAModel>;
// category接口的返回数据类型
typedef QAResponse = Map<String, QAModelSet>;

// 接口转换处理
class QADataStatus extends DataStatus {
  QAResponse? response;
  QADataStatus({required super.status, super.errorMsg, this.response});
}
