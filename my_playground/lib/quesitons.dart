import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String questionText;

  Questions(this.questionText);

  @override
  Widget build(BuildContext context) {
  return  Container(
      width: double.infinity,
      margin: const EdgeInsets.all(30),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20, color: Colors.deepOrange),
        textAlign: TextAlign.center,
      )
    );
  }
}