import 'package:flutter/material.dart';
import './ToDo.dart';

class TodoList extends StatelessWidget {
  final String title;
  final String description;

  TodoList(this.title, this.description);

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
                padding: EdgeInsets.all(5),
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
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Description: ',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(description,
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
              onPressed: () {
                print('delete');
              },
              icon: Icon(Icons.dangerous)),
        )
      ],
    ));
  }
}
