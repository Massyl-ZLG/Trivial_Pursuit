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

  Future<List<TrivialUser>?> orderBy(String attribute) async {
   // DocumentSnapshot<List<TrivialUser>> usersOrdered = (await _userRef.limit(10)) as DocumentSnapshot<List<TrivialUser>>;
    QuerySnapshot<TrivialUser> usersOrdered = await _userRef.get();
    List<TrivialUser> allData =  usersOrdered.docs.map((doc) => doc.data()).toList();
    return allData;
  }


}