import 'package:flutter/material.dart';
import 'package:flutter_project_1/answer.dart';

import './question.dart';

import './question.dart';

void main() => runApp(MyApp());

// when the external data changes, StatefulWidget can be recreated
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// State is persistent
// <MyApp>은 MyAppState가 MyApp 클래스에 속해있다고 알려주는 포인터
// private 클래스로 만들어주기 위해서 _를 붙이는것이 관례
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  
  void _answerQuestion() {
    // setState는 build 메서드를 호출하고 build 메서드는 위젯트리를 다시 빌드한다
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }
  // @override 데코레이터는 위젯에 의해 제공된 build 메서드를 override 했다고 명시하기 위해 사용한것. 통상적으로 쓰임
  @override
  // build 메서드를 사용해 MaterialApp 위젯을 리턴하고 context에서 위젯 트리에서의 위치 정보를 확인할 수 있다
  Widget build(BuildContext context) {
    var questions = [
      {'questionText': 'What\'s is your favorite color?', 'answers': ['black', 'red', 'green', 'white', 'blue']}, 
      {'questionText': 'What\'s your favorite animal?', 'answers': ['tiger','lion', 'ox', 'snake', 'rhino']},
      {'questionText': 'What\'s your favorite food?', 'answers': ['김치', '갈비', '초밥', '치킨', '순대국']},
    ];
    // MaterialApp, Text도 build 메서드를 가지고 있는 클래스다. 생성자를 사용해 Hello 텍스트를 보여주고 있는것
    // return MaterialApp(home: Text('Hello!'),);

    // Scaffold를 사용해서 앱에서 사용할 기본 디자인을 생성한다
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My FIrst App'),),
      body: Column(children: [
        Question(questions[_questionIndex]['questionText']), 
        ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(_answerQuestion, answer);
        }).toList()
      ]),
    ),);
  }
}
