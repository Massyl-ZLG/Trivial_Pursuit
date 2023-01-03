import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:test_flutter/data/dataSources/repositories/question_repository.dart';
import 'package:test_flutter/data/dataSources/repositories/user_repository.dart';
import 'package:test_flutter/page/game/bloc/game_cubit.dart';

import '../../model/question.dart';
import 'bloc/game_state.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  GameCubit? cubit;
  SwipingCardDeck? _deck;

  int _currentIndex = 0;
  final user = FirebaseAuth.instance.currentUser;
  List<String> _currentResponse = [];
  List<Question> _questions = [];
  String _selectedAnswer = "";

  void createQuestion(Question question) {
    /*_currentResponse = [...question.incorrect_answers, question.correct_answer]
      ..shuffle()
      ..toList();*/
    _currentResponse =
        [...question.incorrect_answers, question.correct_answer].toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<QuestionRepository>(create: (context) => QuestionRepository.getInstance()),
            RepositoryProvider<UserRepository>(create: (context) => UserRepository.getInstance()),
          ],
          child: BlocProvider(
              create: (context) {
                cubit = GameCubit(RepositoryProvider.of<UserRepository>(context),
                    RepositoryProvider.of<QuestionRepository>(context),
                );
                return cubit!..fetchQuestion();
              },
              child: BlocConsumer<GameCubit, QuestionState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is Loaded) {
                    createQuestion(state.questions[_currentIndex]);
                    _questions = state.questions;
                    _deck ??= SwipingCardDeck(
                      cardDeck: _questions.map((e) {
                        return Card(
                            color: _questionColor(e.difficulty),
                            shape: _cardBorder(),
                            margin: const EdgeInsets.only(
                            left: 10, bottom: 5, right: 10, top: 5),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 5, right: 10, top: 5),
                                  alignment: Alignment.center,
                                  child: Text(
                                    HtmlUnescape().convert(e.question),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  )),
                            ));
                      }).toList(),
                      onLeftSwipe: (Card card) {
                        setState(() {
                          if (_currentIndex >= 0) _currentIndex += 1;
                          cubit?.nextQuestion(_questions);
                        });
                      },
                      onRightSwipe: (Card) {
                        setState(() {});
                      },
                      onDeckEmpty: () {},
                      cardWidth: 100,
                    );
                    return ListView(children: [
                      _game(state.questions, state),
                    ]);
                  }
                  if (state is GoodAnswer) {
                    return ListView(children: [
                      _game(_questions, state),
                    ]);
                  }
                  if (state is WrongAnswer) {
                    return ListView(children: [
                      _game(_questions, state),
                    ]);
                  }
                  if (state is Finished) {
                    return _finishedGame();
                  }
                  if (state is Error) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 15, bottom: 20, right: 20, top: 10),
                      //apply padding to some sides only
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 25.0,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.blue,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit?.onAnswerValidated(_questions[_currentIndex]);
        },
        focusColor: Colors.red,
        hoverColor: Colors.black,
        backgroundColor: Colors.black12,
        child: const Icon(Icons.check),
      ),
    );
  }

  MaterialColor _questionColor(String difficulty) {
    if (difficulty == "easy") return Colors.green;
    if (difficulty == "medium") return Colors.orange;
    return Colors.red;
  }

  MaterialColor _finalAnswerColor(state, String answer, String trueAnswer) {
    if (state is WrongAnswer || state is GoodAnswer) {
      if (answer == trueAnswer) return Colors.green;
      return Colors.red;
    }

    return Colors.cyan;
  }

  RoundedRectangleBorder _cardBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: Colors.black12,
      ),
    );
  }

  BoxDecoration _scoreAndProgressBoxDecoration() {
    return BoxDecoration(
        color: Color(0xFFfc9463),
        border: Border.all(width: 3.0, color: Colors.black12),
        borderRadius: const BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
            ),
        boxShadow: const [
          BoxShadow(blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
        ] // Make rounded corner of border
        );
  }

  Widget _scoreAndProgress() {
    return Padding(
        padding:
            const EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 10),
        //apply padding to some sides only
        child: Row(children: [
          Expanded(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: _scoreAndProgressBoxDecoration(),
                  child: Text(
                    "Score : ${cubit?.score.toString()}" ?? "0",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ))),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  padding: const EdgeInsets.all(4.0),
                  decoration: _scoreAndProgressBoxDecoration(),
                  child: Text(
                    "Question :  ${_currentIndex + 1} / 10" ?? "0",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  )))
        ]));
  }

  Widget _answerMessage(state) {
    if (state is WrongAnswer || state is GoodAnswer) {
      return Padding(
        padding: EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 10),
        //apply padding to some sides only
        child: Text(
          state is GoodAnswer
              ? "Félicitation c'est une bonne réponse"
              : "Mauvaise réponse",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: state is GoodAnswer ? Colors.green : Colors.red,
            fontSize: 25.0,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: state is GoodAnswer ? Colors.blue : Colors.grey,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),
        ),
      );
    }

    return const Padding(
        padding: EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 10));
  }

  Widget _game(List<Question> question, state) {
    return Column(children: [
      _scoreAndProgress(),
      _answerMessage(state),
      Stack(
        children: [
          _deck!,
          Container(
            width: 300,
            height: 100,
            color: Colors.transparent,
          )
        ],
      ),
      const SizedBox(
        height: 32,
      ),
      Container(
          height: 500,
          width: double.infinity,
          child: ListView(
              children: _currentResponse
                  .map((answer) => InkWell(
                      onTap: () {
                        cubit?.setAnswer(answer);
                        setState(() {
                          _selectedAnswer = answer;
                        });
                      },
                      child: Card(
                        color: (_selectedAnswer == answer && state is Loaded)
                            ? Colors.deepPurple
                            : _finalAnswerColor(state, answer,
                                _questions[_currentIndex].correct_answer),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.only(
                        left: 10, bottom: 5, right: 5, top: 10),
                        child: Container(
                            padding: const EdgeInsets.all(10.0),
                            alignment: Alignment.center,
                            child: Text(
                              HtmlUnescape().convert(answer),
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            )),
                      )))
                  .toList()))
    ]);
  }

  Widget _finishedGame() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
                padding:
                    EdgeInsets.only(left: 15, bottom: 0, right: 20, top: 50),
                child: Image(
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/3a/bb/69/3abb69a4adc81e52d80e83f3d60c97f6.jpg'),
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 70),
                //apply padding horizontal or vertical only
                child: Text(
                  "Félicitation ${user?.email.toString()} tu as un score ${cubit?.score.toString()}  !",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                  ),
                )),
            Padding(
                padding:
                    EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 70),
                //apply padding horizontal or vertical only
                child: IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    // ...
                  },
                ))
          ],
        ));
  }
}
