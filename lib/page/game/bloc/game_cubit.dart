//import 'dart:html';

import 'dart:developer';

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

  void onAnswerValidated(Question question ,  String? selectedAnswer)
  {
      try {
      if(question.correct_answer == selectedAnswer){
        if(question.difficulty == "eazy") _score++;
        else if(question.difficulty == "medium") _score+= 2;
        else if(question.difficulty == "hard") _score+= 3;
        emit(const GoodAnswer());
      }
      for ( var answer in question.incorrect_answers){
          if(answer == selectedAnswer )  emit(const WrongAnswer());
      }
    } on Exception catch (exeption){
      emit(Error(exeption.toString()));
    }

  }


  void nextQuestion(List<Question> questions)
  {
    emit(Loaded(questions));
  }
}