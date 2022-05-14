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
        height: 550,
        // decoration: BoxDecoration(color: Colors.white),
        child: itemList.isEmpty
            ? LayoutBuilder(builder: ((context, constraints) {
                return Container(
                    height: constraints.maxHeight * 0.6,
                    child: Text('There is nothing else to do',
                        style: TextStyle(color: Theme.of(context).errorColor)));
              }))
            : Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return TodoList(
                          itemList[index].id,
                          itemList[index].title,
                          itemList[index].amount,
                          itemList[index].date,
                          deleteTodo);
                    }),
              ));
  }
}
