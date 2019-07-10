import 'package:flutter/material.dart';
import 'package:flutter_scrum_quiz/util/question.dart';
import 'package:flutter_scrum_quiz/util/quiz.dart';
import 'package:flutter_scrum_quiz/ui_elements/answer_button.dart';
import 'package:flutter_scrum_quiz/ui_elements/question_text.dart';
import 'package:flutter_scrum_quiz/ui_elements/answer_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Scrum is agile metodology", true),
    new Question("All activities in Scrum have a timebox", true),
    new Question("The product owner has the final word on the backlog", true),
    new Question("Sprint planing must be done every week", false),
    new Question("Sprint duration is always 2 weeks", false),
    new Question("Scrum advocates for teams with more than 9 people", false),
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
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayIsVisible == true ? new AnswerOverlay(isCorrect, 
        () {
          currentQuestion = quiz.nextQuestion;
          this.setState(() {
            overlayIsVisible = false;
            questionText = currentQuestion.question;
            questionNumber = quiz.questionNumber;
          });
        }
        ) : new Container()
      ],
    );
  }
}
