import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter/model/trivial_user.dart';

class UserFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  static UserFirebase? _instance ;

  static late final CollectionReference<TrivialUser> _userRef;

  UserFirebase._();

  static UserFirebase getInstance(){
    if(_instance == null){
      _userRef = _firebaseFirestore
          .collection('users')
          .withConverter<TrivialUser>(fromFirestore: (snapshot , _) =>
          TrivialUser.fromJson(snapshot.data()!),
          toFirestore: (object , _) => object.toJson());
      _instance = UserFirebase._();
    }
    return _instance!;
  }

  Future<List<TrivialUser>?> orderBy(String attribute , bool descending) async {
    QuerySnapshot<TrivialUser> usersOrdered = await _userRef.orderBy(attribute  , descending : descending).get();
    List<TrivialUser> allData =  usersOrdered.docs.map((doc) => doc.data()).toList();
    return allData;
  }


  Future<List<TrivialUser>?> filterBy(String attribute ,String value ) async {
    QuerySnapshot<TrivialUser> usersOrdered = await _userRef.where(attribute , isEqualTo: value  ).get();
    List<TrivialUser> allData =  usersOrdered.docs.map((doc) => doc.data()).toList();
    return allData;
  }


  Future<TrivialUser?> get(String? uid) async {
    DocumentSnapshot<TrivialUser> user = await _userRef.doc(uid).get();
    return user.data();
  }

  Future<TrivialUser?> setScore(String? uid , int score) async {
    DocumentSnapshot<TrivialUser> user = await _userRef.doc(uid).get();
    _userRef.doc(uid).update({"score" : (user.data()?.score! ?? 0 ) + score});
    return user.data();
  }
  
  


}