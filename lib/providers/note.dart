import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note({
    required int id,
    required String title,
    @JsonKey(name: 'total_questions') // ignore: invalid_annotation_target
    required int totalQuestions,
    @JsonKey(name: 'distinct_labels') // ignore: invalid_annotation_target
    required List<String> distinctLabels,
    @JsonKey(name: 'user_id') // ignore: invalid_annotation_target
    required int userId,

    // required int userId,
  }) = _Note;

  /*
   "user_id": 2, 
  "title": "note1",
  "id": 1,
  "total_questions": 0,
  "distinct_labels": []
  */
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  // 这种写法无法生成代码
  // factory Note.fromJson(Map<String, dynamic> json) {
  //   Map<String, dynamic> formartJson = {
  //     "id": json["id"],
  //     "title": json["title"],
  //     "totalQuestions": json["total_questions"],
  //     "distinctLabels": json["distinct_labels"],
  //     "userId": json["user_id"],
  //   };
  //   return _$NoteFromJson(formartJson);
  // }
}
