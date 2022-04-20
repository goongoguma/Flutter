import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function addTransactions;

  TransactionForm(this.addTransactions);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isNotEmpty || enteredAmount > 0) {
      widget.addTransactions(enteredTitle, enteredAmount);
      Navigator.of(context).pop();
      return;
    } 
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTransaction(),
            ),
            FlatButton(
              child: Text('Add Item'),
              textColor: Colors.pink,
              onPressed: submitTransaction,
            )
          ],
        ),
      ),
    );
  }
}
