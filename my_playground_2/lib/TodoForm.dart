import 'package:flutter/material.dart';
import './ToDo.dart';

class TodoForm extends StatefulWidget {
  final Function addNewTodo;
  TodoForm(this.addNewTodo);
  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _descriptionController = TextEditingController();

    void onClickSubmit() {
      if (_titleController.text.isEmpty ||
          _descriptionController.text.isEmpty) {
        return null;
      }
      widget.addNewTodo(_titleController.text, _descriptionController.text);

      Navigator.of(context).pop();
    }

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
                  onSubmitted: (_) => onClickSubmit(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Description'),
                  controller: _descriptionController,
                  onSubmitted: (_) => onClickSubmit(),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.blueGrey),
                  child: Text('Submit'),
                  onPressed: onClickSubmit,
                )
              ],
            )));
  }
}
