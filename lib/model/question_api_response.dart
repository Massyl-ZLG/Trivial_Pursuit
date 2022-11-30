import 'package:freezed_annotation/freezed_annotation.dart';

import 'question.dart';

 
part 'question_api_response.freezed.dart';
part 'question_api_response.g.dart';

/// {@template question_api_response}
/// QuestionApiResponse description
/// {@endtemplate}
@freezed
class QuestionApiResponse with _$QuestionApiResponse {
  /// {@macro question_api_response}
  const factory QuestionApiResponse({ 
    required List<Question> results,
  }) = _QuestionApiResponse;
  
    /// Creates a QuestionApiResponse from Json map
  factory QuestionApiResponse.fromJson(Map<String, dynamic> data) => _$QuestionApiResponseFromJson(data);
}
