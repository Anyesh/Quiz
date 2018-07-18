import "package:flutter/material.dart";

import "../utils/question.dart";
import "../utils/quiz.dart";

import "../UI/answer_button.dart";
import "../UI/question_text.dart";
import "../UI/correct_wrong_overlay.dart";
import "../pages/score_page.dart";

class QuizPage extends StatefulWidget {
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("I love you", true),
    Question("Pizza is healthy", false),
    Question("FLitter is awsm", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect = false;
  bool overlayVisible = false;

  @override
  void initState() {
    super.initState();

    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Column(
        children: <Widget>[
          AnswerButton(true, () => handleAnswer(true)),
          QuestionText(questionText, questionNumber),
          AnswerButton(false, () => handleAnswer(false))
        ],
      ),
      overlayVisible == true
          ? CorrectWrongOverlay(isCorrect, () {
              if (quiz.length == questionNumber) {
                Navigator.of(ctx).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext ctx) =>
                            ScorePage(quiz.score, quiz.length)),
                    (Route route) => route == null);
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState(() {
                overlayVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
              });
            })
          : Container()
    ]);
  }
}
