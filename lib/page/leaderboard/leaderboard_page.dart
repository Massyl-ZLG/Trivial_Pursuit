import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/data/dataSources/repositories/user_repository.dart';
import 'package:test_flutter/model/trivial_user.dart';
import 'package:test_flutter/page/leaderboard/bloc/leaderboard_cubit.dart';
import 'package:test_flutter/page/leaderboard/bloc/leaderboard_state.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {

  LeaderboardCubit? cubit;

  List<TrivialUser> _users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RepositoryProvider(
          create: (context) => UserRepository.getInstance(),
          child: BlocProvider(
            create : (context) {
              cubit = LeaderboardCubit(
                  repository: RepositoryProvider.of<UserRepository>(context));
              return cubit!..fetchUsers();
            },
            child: BlocConsumer<LeaderboardCubit , LeaderboardState>(
              listener: (context, state) {},
              builder: (context, state) {
                if(state is Loaded){
                  return  Text('lool');
                }
                if(state is Error){

                }
                return CircularProgressIndicator();
              },
            ),
          ),
        )
    );
  }
}
