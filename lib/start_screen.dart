import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // startQuiz is an argument that contains a function as a value
  // use this. to automatically set the value we get from startQuiz argument as a value for final void Function() startQuiz variable
  const StartScreen(this.startQuiz, {super.key});

  // use final bcs we'll only set this once when the StartScreen widget is created
  // holding the callback function to be executed when the quiz is started
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the Fun Way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 250, 194, 238),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
