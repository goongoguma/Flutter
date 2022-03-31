import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: const Text(
        "This is the title", 
        style: TextStyle(fontSize: 30, color: Colors.blue), 
        textAlign: TextAlign.center,
      ),
    );
  }
}