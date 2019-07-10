import 'package:flutter/material.dart';
import 'package:flutter_scrum_quiz/util/question.dart';
import 'package:flutter_scrum_quiz/util/quiz.dart';
import 'package:flutter_scrum_quiz/ui_elements/answer_button.dart';
import 'package:flutter_scrum_quiz/ui_elements/question_text.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("correct")),
            new QuestionText("Pizza is nice", 1),
            new AnswerButton(false, () => print("false")),
          ],
        ),
      ],
    );
  }
}
