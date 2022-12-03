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
    return await _usersFirestore.orderBy("score");
  }
}