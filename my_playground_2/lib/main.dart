import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ToDo.dart';
import './TodoList.dart';
import './TodoForm.dart';
import './TodoMenu.dart';
import './chart.dart';
import './toggle_switch.dart';

// https://github.com/goongoguma/Flutter/commit/b6c4f3a44e951a5bf1938898a3854a9bf40d79c9
// 여기서부터 시작하면 됨
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
  bool isToggled = false;

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

  void _onChangeToggle(value) {
    setState(() {
      isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('My IOS Playground'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    child: Icon(CupertinoIcons.add_circled_solid),
                    onTap: () => _startNewTodo(context))
              ],
            ),
          )
        : AppBar(
            title: Text('My Playground'),
            actions: [
              IconButton(
                  onPressed: () => _startNewTodo(context),
                  icon: const Icon(Icons.add_box_outlined))
            ],
          )) as PreferredSizeWidget;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final pageBody = SafeArea(
        child: Center(
            child: isLandScape
                ? Column(
                    children: [
                      ToggleSwitch(_itemList, isToggled, _onChangeToggle),
                      isToggled
                          ? Container(
                              child: Chart(_itemList),
                              height: (MediaQuery.of(context).size.height -
                                      appBar.preferredSize.height -
                                      // MediaQuery.of(context).padding.top -> 상단 상태 표시줄 높이
                                      MediaQuery.of(context).padding.top) *
                                  0.4,
                            )
                          : Container(
                              child: TodoMenu(_itemList, _deleteTodo),
                              height: (MediaQuery.of(context).size.height -
                                      appBar.preferredSize.height -
                                      MediaQuery.of(context).padding.top) *
                                  0.6)
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        child: Chart(_itemList),
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                // MediaQuery.of(context).padding.top -> 상단 상태 표시줄 높이
                                MediaQuery.of(context).padding.top) *
                            0.4,
                      ),
                      Container(
                          child: TodoMenu(_itemList, _deleteTodo),
                          height: (MediaQuery.of(context).size.height -
                                  appBar.preferredSize.height -
                                  MediaQuery.of(context).padding.top) *
                              0.6)
                    ],
                  )));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget)
        : Scaffold(
            appBar: appBar,
            body: SafeArea(
              child: SingleChildScrollView(
                child: pageBody,
              ),
            ),
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(
                      Icons.design_services_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () => _startNewTodo(context),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat, // This trailing comma makes auto-formatting nicer for build methods.
          );
  }
}
