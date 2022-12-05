// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionApiResponse _$$_QuestionApiResponseFromJson(
        Map<String, dynamic> json) =>
    _$_QuestionApiResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => Question.fromJson(e))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionApiResponseToJson(
        _$_QuestionApiResponse instance) =>
    <String, dynamic>{
      'results': instance.results
        .map((e) =>  e.toJson())
        .toList(),
      };

