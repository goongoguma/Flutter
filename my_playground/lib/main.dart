import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(id: 'id1', title: '운동화', amount: 45000, date: DateTime.now()),
    Transaction(id: 'id2', title: '핸드폰', amount: 130000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            )
          ),
          Column(children: transactions.map((tx) {
            return Container(child: 
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(child: Text(tx.amount.toString()),),
              Column(children: [
                Container(child: Text(tx.title, style: TextStyle(color: Colors.deepPurpleAccent))),
                Container(child: Text(tx.amount.toString(), style: TextStyle(color: Colors.deepOrange),))
              ]
            )]) );
          }).toList())
        ],
      ),
    );
  }
}