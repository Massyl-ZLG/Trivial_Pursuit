import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter/model/question.dart';

 
part 'question_firebase.freezed.dart';
part 'question_firebase.g.dart';

/// {@template question_firebase}
/// QuestionFirebase description
/// {@endtemplate}
@freezed
class QuestionFirebase with _$QuestionFirebase {
  /// {@macro question_firebase}
  const factory QuestionFirebase({ 
    required List<Question> results,
    required String date,
  }) = _QuestionFirebase;
  
    /// Creates a QuestionFirebase from Json map
  factory QuestionFirebase.fromJson(Map<String, dynamic> data) => _$QuestionFirebaseFromJson(data);
}
