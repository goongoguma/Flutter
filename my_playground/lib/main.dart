import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(decoration: InputDecoration(labelText: 'Title'),),
                  TextField(decoration: InputDecoration(labelText: 'Price'),),
                  FlatButton(onPressed: () {}, child: Text('Add Item'), textColor: Colors.pink,)
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.indigoAccent, width: 3)),
            child: Column(
                children: transactions.map((tx) {
              return Container(
                child: Row(children: [
                  Container(
                      child: Text(
                        '\₩${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.green),
                      ),
                      padding: EdgeInsets.all(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                        child: Text(tx.title,
                            style: TextStyle(color: Colors.deepPurpleAccent))),
                    Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                      DateFormat('yyyy-MM-dd').format(tx.date),
                      style: TextStyle(color: Colors.deepOrange),
                    ))
                  ])
                ]),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 2)),
              );
            }).toList()),
          )
        ],
      ),
    );
  }
}
