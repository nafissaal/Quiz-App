import 'package:flutter/material.dart';

// displays a circle with a question number

class QuestionIdentifier extends StatelessWidget {
  // A constant constructor for initializing the widget
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  // declares a final variable (questionIndex) to store the question's index (position)
  final int questionIndex;
  // to store whether the answer was correct
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    // calculates the actual question number by adding 1 to the questionIndex
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // Color is set based on isCorrectAnswer
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 88, 180, 255)
            : const Color.fromARGB(255, 255, 88, 197),
      ),
      child: Text(
        // displays the question number inside the container
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
