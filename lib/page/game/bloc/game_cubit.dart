//import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/dataSources/repositories/question_repository.dart';
import 'package:test_flutter/page/game/bloc/game_state.dart';

import '../../../model/question.dart';

class GameCubit extends Cubit<QuestionState> {
  final QuestionRepository repository ;

  late Question  _lastQuestion;

  int _score = 0 ;

  String selectedAnswer = '';

  GameCubit({required this.repository}) : super(Initial());

  setAnswer(String answer){
    selectedAnswer = answer;
    emit(AnswerSelected(answer));
  }

  Future<void> fetchQuestion() async {
    emit(Initial());

    try {
      final list = await repository.getQuestionsOfTheDay();
      _lastQuestion = list.last;
      emit(Loaded(list));
    } on Exception catch (exeption){
      emit(Error(exeption.toString()));
    }
  }

  void onCardSwiped(Question question ,  String selectedAnswer)
  {

    if(question.correct_answer == selectedAnswer){
      _score++;
      emit(const GoodAnswer());
    }
    for ( var answer in question.incorrect_answers){
        if(answer == selectedAnswer )  emit(const WrongAnswer());
    }

  }
}