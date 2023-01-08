import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_flutter/page/profil/bloc/profil_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/dataSources/repositories/user_repository.dart';

class ProfilCubit extends Cubit<ProfilState> {
  final UserRepository repository ;



  ProfilCubit({required this.repository}) : super(Initial());


  Future<void> fetchUser(String? uid) async {
    emit(Initial());
    try {
        final user = await repository.getUser(uid);
        emit(Loaded(user));

    } on Exception catch (exeption){
      emit(Error(exeption.toString()));
    }
  }

  void show(){
    emit(Initial());
  }

  void edit(){
    emit(Edit());
  }

  Future<void> updatePseudo(String? uid , String pseudo) async{
    try {
      final user = await repository.updatePseudo(uid ,  pseudo);
      emit(Loaded(user));
    } on Exception catch (exeption){
      emit(Error(exeption.toString()));
    }
  }

}