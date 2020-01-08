import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz({this.answerQuestion, this.questions, this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        //the ... will spread the list and add the item to children list
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          //unname function use like (parma){ return}
          return Answer(
              () =>answerQuestion(answer['score']),//using () to create unnamed funcction which execute answerQuestion with parmater, then pass the unnamed function to onpressed aaction.
              answer[
                  'text']); //the _answerQuestion is used as pointer to the function _answerQuestion()
        }).toList()
      ],
    );
  }
}
