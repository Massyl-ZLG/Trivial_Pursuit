import 'package:test_flutter/data/dataSources/remote/question_api.dart';
import 'package:test_flutter/data/dataSources/remote/question_firebase.dart';

class QuestionRepository {
  static QuestionRepository? _instance ;

  QuestionRepository._();

  static QuestionRepository getInstance(){
    _instance ??= QuestionRepository._();
    return _instance!;
  }

  final QuestionApi _questionApi = QuestionApi.getInstance();
  final QuestionFirebase _questionsFirestore = QuestionFirebase.getInstance();


  String _getDate(){
    DateTime today = DateTime.now();
    return '${today.day}/${today.month}/${today.year}'
  }

  Future<List<Question>> getQuestionsOfTheDay() async {
    QuestionApiResponse? response = await _questionsFirestore.get();
    if(response != null){
      return response.results;
    }else {
      List<Question> questions = await getFilteredQuestions();
      QuestionApiResponse objectToReturn = QuestionApiResponse(
        results : questions,
        date : _getDate()
      );

      //Delete le documents dans firestore
      //Put objectToReturn a firestore
      return questions;
    }
  }
}