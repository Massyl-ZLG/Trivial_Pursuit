// import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/dataSources/repositories/user_repository.dart';
import 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final UserRepository repository ;

  LeaderboardCubit({required this.repository}) : super(Initial());


  Future<void> fetchUsers() async {
    emit(Initial());

    try {
      final list = await repository.getUserOrderByScore();
      emit(Loaded(list!));
    } on Exception catch (exeption){
      emit(Error(exeption.toString()));
    }
  }

}