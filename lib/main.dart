import 'package:flutter/material.dart';

import './quiz.dart';

import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    throw UnimplementedError();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who wrote the novel Raven?',
      'answers': [
        {'text': 'Jane Austin', 'score': 0},
        {'text': 'Edgar Allan Poe', 'score': 5},
        {'text': 'F.Scott Fitzgerald', 'score': 0},
        {'text': 'Virgnia Wolf', 'score': 0}
      ],
    },
    {
      'questionText': 'Who wrote the novel Nineten Eighty four?',
      'answers': [
        {'text': 'George Orwell', 'score': 5},
        {'text': 'Ray Bradbury', 'score': 0},
        {'text': 'J.D Salinger', 'score': 0},
        {'text': 'Harper Lee', 'score': 0}
      ],
    },
    {
      'questionText': 'Who wrote the novel Great Expectation?',
      'answers': [
        {'text': 'Ernest Hemingway', 'score': 0},
        {'text': 'Mark Twain', 'score': 0},
        {'text': 'William Shakespear', 'score': 0},
        {'text': 'Charles Dickens', 'score': 5}
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more question');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
