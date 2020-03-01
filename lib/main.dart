import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  static const questions =  [
      {
        'questionText': 'what\'s your fav color?',
        'answerText': ['Red', 'Blue', 'Green', 'Yellow'],
      },
      {
        'questionText': 'whats\'s your fav animal?',
        'answerText': ['Lion', 'cat', 'dog', 'tiger'],
      },
      {
        'questionText': 'whats\'s your fav editor?',
        'answerText': ['vs code', 'codeblocks', 'atom', 'sublime'],
      },
    ];

  var _questionIndex = 0;

  void _ansQue() {
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);

    if(_questionIndex<questions.length){
      print('we m\have questions!');
    }
  } 

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            ...(questions[_questionIndex]['answerText'] as List).map((answerText) {
              return Answer(_ansQue, answerText);
            }).toList()
          ],
        ),
      ),
    );
  }
}
