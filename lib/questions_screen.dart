import 'package:flutter/material.dart';
import 'package:quizapp/models/answer_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
   QuestionsScreen({required this.onSelectAnswer,super.key}) ;
  void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex=0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer) ;
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
               textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ... currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer, onTap:() {
                answerQuestion(answer);
              },);
            })

          ],
        ),
      ),
    );
  }
}
