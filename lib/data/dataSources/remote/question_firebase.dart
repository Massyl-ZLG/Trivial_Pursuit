import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/question_api_response.dart';

class QuestionFirebase {
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static QuestionFirebase? _instance ;

  static late final CollectionReference<QuestionApiResponse> _questionRef;

  QuestionFirebase._();

  String _getDate(){
    DateTime today = DateTime.now();
    return '${today.day}/${today.month}/${today.year}';
  }

  static QuestionFirebase getInstance(){
    if(_instance == null){
      _questionRef = _firebaseFirestore
          .collection('questionOfTheDay')
          .withConverter<QuestionApiResponse>(fromFirestore: (snapshot , _) =>
              QuestionApiResponse.fromJson(snapshot.data()!),
          toFirestore: (object , _) => object.toJson());
      _instance = QuestionFirebase._();
    }
    return _instance!;
  }


  Future<void> insertQuestions(QuestionApiResponse questions) async {
     await _questionRef.add(questions);
    //await _questionRef.doc(_getDate()).add(questions);
  }

  Future<QuestionApiResponse?> get() async {
    DocumentSnapshot<QuestionApiResponse> test = await _questionRef.doc(_getDate()).get();
    return test.data();
  }

  Future<void> delete(String id) async {
    return _questionRef.doc(id).delete();
  }

}