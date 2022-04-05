import 'package:flutter/material.dart';

class NewTransacitons extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransacitons(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }

     addTx(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:<Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Title'), 
            controller: titleController,
            onSubmitted: (_) => submitData(),
          ), 
          TextField(
            decoration: InputDecoration(labelText: 'Amount'), 
            controller: amountController, 
            keyboardType: TextInputType.number,
             onSubmitted: (_) => submitData(),
            ),
          FlatButton(
            onPressed: submitData, 
            child: Text('Add Transaction'), 
            textColor: Colors.purple,
          )
        ]
        )
      ),
    );
  }
}