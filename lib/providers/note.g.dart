// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      totalQuestions: (json['total_questions'] as num).toInt(),
      distinctLabels: (json['distinct_labels'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'total_questions': instance.totalQuestions,
      'distinct_labels': instance.distinctLabels,
      'user_id': instance.userId,
    };
