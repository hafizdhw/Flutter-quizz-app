import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "question": 'What\'s your favourite color ?',
      "answer": [
        {'text': "Black", "score": 10},
        {'text': "Blue", 'score': 1},
        {'text': "Green", 'score': 2},
        {'text': "White", 'score': 5}
      ]
    },
    {
      "question": 'What\'s your favourite animal ?',
      "answer": [
        {'text': "Lion", "score": 3},
        {'text': "Duck", "score": 4},
        {'text': "Frog", "score": 1},
        {'text': "Cat", "score": 6}
      ]
    },
    {
      "question": 'What\'s your favourite hero ?',
      "answer": [
        {'text': "Moskov", "score": 5},
        {'text': "Layla", "score": 4},
        {'text': "Miya", "score": 7},
        {'text': "Lancelot", "score": 8}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  void restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, restartQuiz),
      ),
    );
  }
}
