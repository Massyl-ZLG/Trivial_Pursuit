import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/question.dart';
part 'game_state.freezed.dart';

@freezed
class QuestionState with _$QuestionState{
  const factory QuestionState.init() = Initial;
  const factory QuestionState.loaded(List<Question> questions) = Loaded;
  const factory QuestionState.answerSelected(String answer) = AnswerSelected;
  const factory QuestionState.goodAnswer() = GoodAnswer;
  const factory QuestionState.wrongAnswer() = WrongAnswer;

  const factory QuestionState.error(String message) = Error;
}
