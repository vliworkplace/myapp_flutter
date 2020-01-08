import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultSorce;
  final Function resetButton;
  Result(this.resultSorce,this.resetButton);

  String get finalResult {
    var resultText = 'Result is';
    if (resultSorce < 20) {
      resultText = 'less than 20';
    } else if (resultSorce < 21) {
      resultText = 'less than 20';
    } else {
      resultText = resultText + resultSorce.toString();
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            finalResult,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(child: Text('Reset Quiz'),color: Colors.green,onPressed: resetButton,)
        ],
      ),
    );
  }
}
