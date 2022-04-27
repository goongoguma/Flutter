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
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(child: Text('\$${transactions[index].amount}'),),
                        ),
                      ),
                      title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6,),
                      subtitle: Text(DateFormat.yMMMMd().format(transactions[index].date)),
                    )
                  );
                },
              )
            : Column(
                children: [
                  Text('No Transactions added yet!'),
                  SizedBox(height: 30),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ));
  }
}
