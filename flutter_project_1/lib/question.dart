import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // final -> run time constant value
  // 코드가 실행될때 final 값을 고정한다
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
      // TextAlign은 enum값임
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(
        questionText, 
        style: TextStyle(fontSize: 28), 
        textAlign: TextAlign.center,
      )
    );
  }
}
