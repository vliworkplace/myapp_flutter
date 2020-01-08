import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyFirstApp());
}

//Flutter is better to have lot smaller widget
//Stateful mean have data and can refresh via internal data such as var,need state odject as pair, use setState((){}) to refresh object
//Stateless mean the internal data will no refresh the widget, therefore, only refresh on new create
class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }
}

//add _ at the front to priviate
class _MyFirstAppState extends State<MyFirstApp> {
  var _questionIndex = 0;
  var _totalscore = 0;
  //Use const is becauce is never change, hard code
  //use final when set in runtime, can be change when program run
  final _questions = [
    // this is type map
    {
      'questionText': 'Question 1',
      'answers': [
        {'text': 'a', 'score': 1},
        {'text': 'b', 'score': 2},
        {'text': 'c', 'score': 3}
      ]
    },
    {
      'questionText': 'Question 2',
      'answers': [
        {'text': 'd', 'score': 11},
        {'text': 'e', 'score': 12},
        {'text': 'f', 'score': 13}
      ]
    },
    {
      'questionText': 'Question 3',
      'answers': [
        {'text': 'g', 'score': 21},
        {'text': 'h', 'score': 22},
        {'text': 'i', 'score': 23}
      ]
    }
  ];
  
  void _answerQuestion(int score) {

    _totalscore= _totalscore+score;
    if (_questionIndex < _questions.length) {
      //inform program to refresh, will run build after setState() finish

      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print('Answer');
    } else {
      /*setState(() {
       _questionIndex=0;
      });*/
      print('Reset');
    }
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App
      home: Scaffold(
        // Template
        appBar: AppBar(
          title: Text('My First App'),
          backgroundColor: Colors.blue,
        ),
        body: _questionIndex < _questions.length // this is a if
            ? Quiz(
                answerQuestion: _answerQuestion, // pass pointer of function not allow parmater. check quiz.dart to pass with parameter
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalscore,_resetQuiz), // : is else
      ),
    );
  }
}
