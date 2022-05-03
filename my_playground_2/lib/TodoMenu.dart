import 'package:flutter/material.dart';
import './ToDo.dart';
import 'TodoList.dart';

class TodoMenu extends StatelessWidget {
  final List<Todo> itemList;
  final Function deleteTodo;

  TodoMenu(this.itemList, this.deleteTodo);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        decoration: BoxDecoration(color: Colors.indigo),
        child: itemList.isEmpty
            ? Container(
                child: Text('There is nothing else to do',
                    style: TextStyle(color: Theme.of(context).errorColor)))
            : Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return TodoList(
                          itemList[index].id,
                          itemList[index].title,
                          itemList[index].description,
                          itemList[index].date,
                          deleteTodo);
                    }),
              ));
  }
}
