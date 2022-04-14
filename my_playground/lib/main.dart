import 'package:flutter/material.dart';
import 'widget/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Column에서 Card의 넓이나 높이를 조절하고 싶으면 Container로 감싸야함
          // 대신 Column안에 있는 아이템들의 위치는 조절 가능
          Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              )),
          UserTransaction(),
        ],
      ),
    );
  }
}
