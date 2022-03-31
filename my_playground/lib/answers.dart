import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final VoidCallback onClickButton;
  final String answer;

  Answers(this.onClickButton, this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      child:  ElevatedButton(onPressed: onClickButton, child: Text(answer))
    );
  }
}