import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  // the callback function to be executed when an answer is selected
  // to ensuring that chooseAnswer gets executed whenever an answer gets picked in the question screen widget
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // A variable to keep track of the current question index
  var currentQuestionIndex = 0;

  // A method to handle the selection of an answer
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; //increments the value only by 1
    });
  }

  @override
  Widget build(context) {
    // Gets the current question based on the index
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //used all width availaible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              //by adding a . after a variable / constant that contains an object, the available data properties and method that exist on the object can be accessed
              //the available properties & methods are the properties & methods defined in the class blueprint of that object
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 250, 194, 238),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
