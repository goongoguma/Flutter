import 'package:flutter/material.dart';
import 'ToDo.dart';
import './TodoList.dart';
import './TodoForm.dart';
import './TodoMenu.dart';
import './chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.brown,
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              )
          // colorScheme:
          //     ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange)
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _itemList = [];

  void _addNewTodo(String todoTitle, double amount, DateTime date) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: todoTitle,
      amount: amount,
      date: date,
    );
    setState(() {
      _itemList.add(newTodo);
    });
  }

  void _startNewTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TodoForm(_addNewTodo),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _deleteTodo(String id) {
    setState(() {
      _itemList.removeWhere((el) => el.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Playground'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Chart(_itemList),
            TodoMenu(_itemList, _deleteTodo)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.design_services_rounded,
          color: Colors.indigo,
          size: 30,
        ),
        onPressed: () => _startNewTodo(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
