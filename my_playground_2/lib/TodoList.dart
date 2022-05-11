import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './ToDo.dart';

class TodoList extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteTodo;

  TodoList(this.id, this.title, this.amount, this.date, this.deleteTodo);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Text('Title: ',
                            style: Theme.of(context).textTheme.headline5)),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(title,
                          style: Theme.of(context).textTheme.subtitle1),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Amount: ',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('\$${amount}',
                          style: Theme.of(context).textTheme.subtitle1),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Date: ',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(DateFormat.yMMMMd().format(date),
                          style: Theme.of(context).textTheme.subtitle1),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: IconButton(
              onPressed: () => deleteTodo(id), icon: Icon(Icons.dangerous)),
        )
      ],
    ));
  }
}
