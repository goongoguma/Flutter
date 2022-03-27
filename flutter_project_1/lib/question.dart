import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // StatelessWidget에서 변할 수 있는 값 앞에 final 사용
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}