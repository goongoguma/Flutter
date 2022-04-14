import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './transaction_list.dart';
import './transaction_form.dart';
import 'package:intl/intl.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> transactions = [
    Transaction(id: 'id1', title: '운동화', amount: 45000, date: DateTime.now()),
    Transaction(id: 'id2', title: '핸드폰', amount: 130000, date: DateTime.now()),
  ];

  void _addTransactions(String title, double amount) {
    final newItem = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

        print(title);

    setState(() {
      transactions.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TransactionForm(_addTransactions), TransactionList(transactions)],
    );
  }
}
