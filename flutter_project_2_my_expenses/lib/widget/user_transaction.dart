import 'package:flutter/material.dart';
import './new_transction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: '맥북', amount: 19.99, date: DateTime.now()),
    Transaction(id: 't2', title: '아이폰', amount: 25.99, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(), TransactionList(_userTransactions)],
    );
  }
}
