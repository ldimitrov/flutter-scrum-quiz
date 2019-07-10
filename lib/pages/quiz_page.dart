import 'package:flutter/material.dart';
import 'package:flutter_scrum_quiz/pages/score_page.dart';
import 'package:flutter_scrum_quiz/util/question.dart';
import 'package:flutter_scrum_quiz/util/quiz.dart';
import 'package:flutter_scrum_quiz/ui_elements/answer_button.dart';
import 'package:flutter_scrum_quiz/ui_elements/question_text.dart';
import 'package:flutter_scrum_quiz/ui_elements/answer_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Scrum is agile metodology", true),
    Question("All activities in Scrum have a timebox", true),
    Question("The product owner has the final word on the backlog", true),
    Question("Sprint planing must be done every week", false),
    Question("Sprint duration is always 2 weeks", false),
    Question("Scrum advocates for teams with more than 9 people", false),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayIsVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionNumber = quiz.questionNumber;
    questionText = currentQuestion.question;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayIsVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)),
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayIsVisible == true
            ? AnswerOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ScoreBoardPage(quiz.score, quiz.length)),
                      (Route<dynamic> route) => false);
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayIsVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : Container()
      ],
    );
  }
}
