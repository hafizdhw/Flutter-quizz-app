import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]["question"]),
        ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
            .map((e) => Answer(() => answerQuestion(e["score"]), e["text"]))
            .toList()
      ],
    );
  }
}
