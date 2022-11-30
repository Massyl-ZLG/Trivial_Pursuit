// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionFirebase _$$_QuestionFirebaseFromJson(Map<String, dynamic> json) =>
    _$_QuestionFirebase(
      results: (json['results'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionFirebaseToJson(_$_QuestionFirebase instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
