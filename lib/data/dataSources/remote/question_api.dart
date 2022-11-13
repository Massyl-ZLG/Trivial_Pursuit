import 'dart:convert';
import'package:http/http.dart' as http;

import '../../../model/question.dart';
import '../../../model/question_api_response.dart';

class QuestionApi {
  final String _baseUrl = "opentdb.com";

  static QuestionApi? _instance;

  static getInstance(){
    _instance ??= QuestionApi._();
    return _instance;
  }

  QuestionApi._();

  Future<List<Question>> getQuestionsOfTheDay() async {
    final queryParameters = { 'amount' : '10'};
    final uri = Uri.https(_baseUrl , '/api.php' , queryParameters);
    //Uri.parse("https://opentdb.com/api.php?amount=10");

    final response = await http.get(uri);
    if(response.statusCode  == 200){
      QuestionApiResponse questionApiResponse =
        QuestionApiResponse.fromJson(jsonDecode(response.body));
        return questionApiResponse.results!;
    }else {
      throw Exception("Failed to load words");
    }
  }
}