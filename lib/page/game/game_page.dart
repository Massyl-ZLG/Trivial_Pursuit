import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:test_flutter/data/dataSources/repositories/question_repository.dart';
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

  List<String> _currentResponse = [];
  List<Question> _questions = [];

  void createQuestion(Question question) {
    _currentResponse = [...question.incorrect_answers, question.correct_answer]
      ..shuffle()
      ..toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
          create: (context) => QuestionRepository.getInstance(),
          child: BlocProvider(
              create: (context) {
                cubit = GameCubit(
                    repository:
                        RepositoryProvider.of<QuestionRepository>(context));
                return cubit!..fetchQuestion();
              },
              child: BlocConsumer<GameCubit, QuestionState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is Loaded) {
                    createQuestion(state.questions[_currentIndex]);
                    _questions = state.questions;
                    _deck ??= SwipingCardDeck(
                      cardDeck: state.questions.map((e) {
                        return Card(
                            color: _questionColor(e.difficulty),
                            shape: _cardBorder(),
                            margin: const EdgeInsets.all(20.0),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Container(
                                  padding: const EdgeInsets.all(10.0),
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
                          if (_currentIndex > 0) _currentIndex += 1;
                          createQuestion(_questions[_currentIndex]);
                        });
                      },
                      onRightSwipe: (Card) {
                        setState(() {
                          _currentIndex -= 1;
                          createQuestion(_questions[_currentIndex]);
                        });
                      },
                      onDeckEmpty: () {},
                      cardWidth: 200,
                    );
                    return Column(children: [
                      _scoreAndProgress(),
                      // _deck ??= SwipingCardDeck( to replace
                      SwipingCardDeck(
                        cardDeck: state.questions.map((e) {
                          return Card(
                              color: _questionColor(e.difficulty),
                              shape:  _cardBorder(),
                              margin: const EdgeInsets.all(20.0),
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Container(
                                    padding: const EdgeInsets.all(10.0),
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
                            if (_currentIndex > 0) _currentIndex += 1;
                            createQuestion(_questions[_currentIndex]);
                          });
                        },
                        onRightSwipe: (Card) {
                          setState(() {
                            _currentIndex -= 1;
                            createQuestion(_questions[_currentIndex]);
                          });
                        },
                        onDeckEmpty: () {},
                        cardWidth: 200,
                      ),
                      //_deck as Widget,
                      //_game( state.questions) , // To replace currentResponse etc ..
                      ..._currentResponse
                          .map((response) => InkWell(
                              onTap: () {
                                setState(() {
                                  cubit?.setAnswer(response);
                                });
                              },
                              child: Card(
                                color: cubit?.selectedAnswer == response
                                    ? Colors.green
                                    : Colors.cyan,
                                shape: _cardBorder(),
                                margin: const EdgeInsets.all(20.0),
                                child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      HtmlUnescape().convert(response),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16),
                                    )),
                              )))
                          .toList()
                    ]);
                  }

                  if (state is GoodAnswer) {
                    return Column(children: [
                      _scoreAndProgress(),
                      _answerMessage(state),
                      SwipingCardDeck(
                        cardDeck: _questions.map((e) {
                          return Card(
                            color: _questionColor(e.difficulty),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(20.0),
                            child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      HtmlUnescape().convert(e.question),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16),
                                    ))),
                          );
                        }).toList(),
                        onLeftSwipe: (Card card) {
                          setState(() {
                            _currentIndex += 1;
                            cubit?.nextQuestion(_questions);
                          });
                        },
                        onRightSwipe: (Card) {
                          setState(() {
                            _currentIndex += 1;
                            cubit?.nextQuestion(_questions);
                          });
                        },
                        onDeckEmpty: () {},
                        cardWidth: 200,
                      ),
                      ..._currentResponse.map((response) => Card(
                            color: _finalAnswerColor(response,
                                _questions[_currentIndex].correct_answer),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(20.0),
                            child: Container(
                                padding: const EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  HtmlUnescape().convert(response),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ))
                    ]);
                  }
                  if (state is WrongAnswer) {
                    return Column(children: [
                      _scoreAndProgress(),
                      _answerMessage(state),
                      SwipingCardDeck(
                        cardDeck: _questions.map((e) {
                          return Card(
                            color: _questionColor(e.difficulty),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(20.0),
                            child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      HtmlUnescape().convert(e.question),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 16),
                                    ))),
                          );
                        }).toList(),
                        onLeftSwipe: (Card card) {
                          setState(() {
                            _currentIndex += 1;
                            cubit?.nextQuestion(_questions);
                          });
                        },
                        onRightSwipe: (Card) {
                          setState(() {
                            _currentIndex += 1;
                            cubit?.nextQuestion(_questions);
                          });
                        },
                        onDeckEmpty: () {},
                        cardWidth: 200,
                      ),
                      ..._currentResponse.map((response) => Card(
                            color: _finalAnswerColor(response,
                                _questions[_currentIndex].correct_answer),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(20.0),
                            child: Container(
                                padding: const EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  HtmlUnescape().convert(response),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ))
                    ]);
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
          //_currentResponse = [];
        },
        child: const Icon(Icons.check),
      ),
    );
  }



  MaterialColor _questionColor(String difficulty) {
    if (difficulty == "easy") return Colors.blue;
    if (difficulty == "medium") return Colors.orange;
    return Colors.red;
  }

  MaterialColor _finalAnswerColor(String answer, String trueAnswer) {
    if (answer == trueAnswer) return Colors.green;
    return Colors.red;
  }

  RoundedRectangleBorder  _cardBorder(){
    return  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const  BorderSide(
        color: Colors.black12,
      ),
    );
  }

  BoxDecoration _scoreAndProgressBoxDecoration() {
    return BoxDecoration(
        color: Colors.cyan,
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
                      fontSize: 16.0,
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
                      fontSize: 16.0,
                    ),
                  )))
        ]));
  }

  Widget _answerMessage(state) {
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

  Widget _game(List<Question> question) {
    return Column(children: [
      _scoreAndProgress(),
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
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _currentResponse
                  .map((answer) => InkWell(
                      onTap: () {
                        cubit?.setAnswer(answer);
                      },
                      child: Card(
                        color: cubit?.selectedAnswer == answer
                            ? Colors.green
                            : Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(20.0),
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

// Widget _game(List<Question> question) {
//   return Column(
//       children: [
//       _scoreAndProgress(),
//         Stack(
//           children: [
//             _deck!,
//             Container(
//               width: 300,
//               height: 100,
//               color: Colors.transparent,
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 32,
//         ),
//         Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children :  _currentResponse.map((answer) =>
//                     InkWell(
//                         onTap: () {
//                             cubit?.setAnswer(answer);
//                         },
//                         child: Card(
//                           color: cubit?.selectedAnswer == answer
//                               ? Colors.green
//                               : Colors.cyan,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           margin: const EdgeInsets.all(20.0),
//                           child: Container(
//                               padding: const EdgeInsets.all(10.0),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 HtmlUnescape().convert(answer),
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(fontSize: 16),
//                               )),
//                         ))
//                 ).toList()
//             )
//         )
//       ]
//   );
// }
}
