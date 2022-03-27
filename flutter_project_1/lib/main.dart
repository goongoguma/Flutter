import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;
  
  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
  }
  // @override 데코레이터는 StatelessWidget에 의해 제공된 build 메서드를 override 했다고 명시하기 위해 사용한것. 통상적으로 쓰임
  @override
  // build 메서드를 사용해 MaterialApp 위젯을 리턴하고 context에서 위젯 트리에서의 위치 정보를 확인할 수 있다
  Widget build(BuildContext context) {
    var questions = ['What\'s is your favorite color?', 'What\'s your favorite animal?'];
    // MaterialApp, Text도 build 메서드를 가지고 있는 클래스다. 생성자를 사용해 Hello 텍스트를 보여주고 있는것
    // return MaterialApp(home: Text('Hello!'),);

    // Scaffold를 사용해서 앱에서 사용할 기본 디자인을 생성한다
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('My FIrst App'),),
      body: Column(children: [
        Text(questions[questionIndex]), 
        RaisedButton(child: Text('Answer 1'), onPressed: answerQuestion),
        RaisedButton(child: Text('Answer 2'), onPressed: () => print('Answer 2 chosen!')),
        RaisedButton(child: Text('Answer 3'), onPressed: () {
          print('Answer 3 chosen!');
        }),
      ]),
    ),);
  }
}
