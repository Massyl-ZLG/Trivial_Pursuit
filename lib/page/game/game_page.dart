import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/dataSources/repositories/question_repository.dart';
import 'package:test_flutter/page/game/bloc/game_cubit.dart';

import 'bloc/game_state.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  GameCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trivial Pursuit'),
      ),
      body: IndexedStack(
          children: [
            RepositoryProvider(
                create: (context) => QuestionRepository.getInstance(),
                child: BlocProvider(
                    create: (context) {
                      cubit = GameCubit(
                          repository: RepositoryProvider.of<QuestionRepository>(context));
                          return cubit!..fetchQuestion();
                    },
                    child: BlocConsumer<GameCubit, QuestionState>(
                        listener: (context, state) {},
                        builder: (context, state) {},
                    )
                )
            )
          ]
      ),
    );

    return Container();
  }
}
