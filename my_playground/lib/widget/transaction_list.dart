import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigoAccent, width: 3)),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (ctx, index) {
            return Container(
              child: Row(children: [
                Container(
                    child: Text(
                      '\₩${transactions[index].amount.toStringAsFixed(0)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.green),
                    ),
                    padding: EdgeInsets.all(10)),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      child: Text(transactions[index].title,
                          style: TextStyle(color: Colors.deepPurpleAccent))),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(transactions[index].date),
                        style: TextStyle(color: Colors.deepOrange),
                      ))
                ])
              ]),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 2)),
            );
          },
        ));
  }
}
