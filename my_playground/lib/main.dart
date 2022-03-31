import 'package:flutter/material.dart';
import 'quesitons.dart';
import 'answers.dart';
import 'myTitle.dart';
import 'lastPage.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {

  int _counter = 0;
  static const _data = [
    {
      'question': 'What\'s is your favorite movie',
      'answers': [
        {'text': 'spiderman', 'score': 9},
        {'text': 'ironman', 'score': 10},
        {'text': 'thor', 'score': 3},
        {'text': 'joker', 'score': 8},
        {'text': 'superman', 'score': 7.5}
      ]
    },
    {
      'question': 'Who\'s is your favorite person',
      'answers': [
        {'text': 'jaehyun', 'score': 10},
        {'text': 'gildong', 'score': 5},
        {'text': 'donggil', 'score': 6},
        {'text': 'woochi', 'score': 9},
        {'text': 'younggu', 'score': 4.7}
      ]
    }
  ];

  void onClickButton() {
    setState(() {
        _counter = _counter + 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold( 
        appBar: AppBar(
        title: const Text('My Playground'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: _counter <= _data.length - 1 ? Column(children: [
        MyTitle(),
        Questions(_data[_counter]['question'] as String), 
        ...(_data[_counter]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answers(onClickButton, answer['text'] as String);
        })
      ],) : LastPage()
      )
    );
  }
}
