import 'package:flutter/material.dart';

class NewTransacitons extends StatefulWidget {
  final Function addTx;

  NewTransacitons(this.addTx);

  @override
  State<NewTransacitons> createState() => _NewTransacitonsState();
}

class _NewTransacitonsState extends State<NewTransacitons> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

      if (enteredTitle.isEmpty || enteredAmount <= 0) {
        return;
      }

     widget.addTx(enteredTitle, enteredAmount);

     Navigator.of(context).pop();
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