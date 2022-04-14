import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactions;

  TransactionForm(this.addTransactions);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                addTransactions(titleController.text, double.parse(amountController.text));
              },
              child: Text('Add Item'),
              textColor: Colors.pink,
            )
          ],
        ),
      ),
    );
  }
}
