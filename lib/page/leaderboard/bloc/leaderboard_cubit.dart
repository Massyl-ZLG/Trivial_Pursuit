// import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/dataSources/repositories/user_repository.dart';
import 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final UserRepository repository ;

  final searchController = TextEditingController();

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

  Future<void> search(String  text) async {
    emit(Initial());
    try {
      final list = await repository.search(text);
      emit(Loaded(list!));
    } on Exception catch (exeption){
      emit(Error(exeption.toString()));
    }
  }

}