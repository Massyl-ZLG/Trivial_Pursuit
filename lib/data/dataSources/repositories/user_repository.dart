import 'package:test_flutter/data/dataSources/remote/user_firebase.dart';
import 'package:test_flutter/model/trivial_user.dart';

class UserRepository {
  static UserRepository? _instance ;

  UserRepository._();

  static UserRepository getInstance(){
    _instance ??= UserRepository._();
    return _instance!;
  }


  final UserFirebase _usersFirestore = UserFirebase.getInstance();


  Future<List<TrivialUser>?> getUserOrderByScore() async {
    return await _usersFirestore.orderBy("score" , true);
  }

  Future<TrivialUser?> getUser(String? uid ) async {
    return await _usersFirestore.get(uid);
  }


  Future<TrivialUser?> setScore(String? uid , int score)  async {
    return await _usersFirestore.setScore(uid , score);
  }

  Future<List<TrivialUser>?> search(String text)  async {
    return await _usersFirestore.filterBy("pseudo", text);
  }

  Future<TrivialUser?> updatePseudo(String? uid , String pseudo)  async {
    return await _usersFirestore.setPseudo(uid , pseudo);
  }



}