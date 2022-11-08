// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_firebase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionFirebase _$$_QuestionFirebaseFromJson(Map<String, dynamic> json) =>
    _$_QuestionFirebase(
      results: json['results'] as List<Question>,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_QuestionFirebaseToJson(_$_QuestionFirebase instance) =>
    <String, dynamic>{
      'results': instance.results,
      'date': instance.date,
    };
