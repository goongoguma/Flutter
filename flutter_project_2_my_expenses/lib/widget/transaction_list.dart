import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return (Column(
        children: transactions.map((tx) {
      return Card(
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2)),
            child: Text('\$${tx.amount}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple,
                )),
            padding: EdgeInsets.all(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tx.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat.yMMMd().format(tx.date),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          )
        ]),
      );
    }).toList()));
  }
}