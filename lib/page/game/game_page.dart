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
  String _selectedAnswer= "";

  List<String> _currentResponse = [];
  List<Question> _questions = [];

  void createQuestion(Question question) {
    _currentResponse = [
      ...question.incorrect_answers!,
      question.correct_answer!
    ]
      ..shuffle()
      ..toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivial Pursuit'),
      ),
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
                    return Column(children: [
                      SwipingCardDeck(
                        cardDeck: state.questions.map((e) {
                          return Card(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.all(20.0),
                            child: Container(
                                padding: const EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  HtmlUnescape().convert(e.question),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                )),
                          );
                        }).toList(),
                        onLeftSwipe: (Card card) {
                          setState(() {
                            _currentIndex += 1;
                            // cubit?.onCardSwiped(_questions[_currentIndex]);
                            // createQuestion(_questions[_currentIndex]);
                          });
                        },
                        onRightSwipe: (Card) {
                          setState(() {
                            // cubit?.onCardSwiped(_questions[_currentIndex]);
                            // _currentIndex += 1 ;
                            // createQuestion(_questions[_currentIndex]);
                          });
                        },
                        onDeckEmpty: () {},
                        cardWidth: 200,
                      ),
                        for ( var response in _currentResponse )
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(88, 36),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                  side: BorderSide(
                                      width: 10,
                                      color: Colors.blue
                                  )
                              ),
                            ),
                            onPressed: () {
                              _selectedAnswer = response;
                            } ,
                            child: Text( response),
                          ),
                    ]

                    );

                  }
                  if(state is GoodAnswer){
                    return Text("Goooooooood answer");
                  }
                  if(state is WrongAnswer){
                    return Text("BADDDDDDDDDD Answer");
                  }
                  return CircularProgressIndicator();
                },
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cubit?.onCardSwiped(_questions[_currentIndex] , _selectedAnswer );
        },
        child: const Icon(Icons.check),
      ),
    );

    return Container();
  }


  Widget _game(List<Question> question, String? selectedAnswer) {
    return Column(
        children: [
          const SizedBox(
            height: 16,
          ),
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
                  children:
                      _currentResponse
                      .map((answer) => Inkwell(
                        onTap: () {
                        cubit?.setAnswer(answer);
                        },
                    )),


              )
          )
        ]
    )
  }
}
