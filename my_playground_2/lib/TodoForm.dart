import 'package:flutter/material.dart';
import './ToDo.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  final Function addNewTodo;

  TodoForm(this.addNewTodo);

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _date;

  void _onClickSubmit() {
    final enteredAmount = double.parse(_amountController.text);
    if (_titleController.text.isEmpty || enteredAmount < 0 || _date == null) {
      return;
    }
    widget.addNewTodo(_titleController.text, enteredAmount, _date);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _date = pickedDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.blue),
        width: double.infinity,
        child: Card(
            elevation: 10,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  onSubmitted: (_) => _onClickSubmit(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _onClickSubmit(),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_date == null
                          ? 'Choose the date'
                          : DateFormat.yMMMMd().format(_date!)),
                      ElevatedButton(
                          onPressed: _presentDatePicker,
                          child: Text('Pick Calendar'))
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.blueGrey),
                  child: Text('Submit'),
                  onPressed: _onClickSubmit,
                )
              ],
            )));
  }
}
