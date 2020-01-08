import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function onPressedFunction;
  Answer(this.onPressedFunction, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
              child: Text(this.answerText),
              textColor: Colors.white,
              onPressed: onPressedFunction,
              color: Colors.red,
            ),
    );
  }
}