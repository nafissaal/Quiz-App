import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  // The method to create the state of the widget
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// The state class for the Quiz
class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = []; // to store selected answers chosen by user
  var _activeScreen = 'start-screen'; // variable to keep track of the active screen

  // switchScreen is a method to switch to the questions screen
  void _switchScreen() {
    setState(() {
      _activeScreen =
          'questions-screen'; //the value stored in activeScreen will be overrode by 'questions-screen' when executing switchScreen
      // this function perform the data changing activity that should be reflected on the UI
    });
  }

  // this method is for adding answers to selectedAnswers (handle the selection of an answer)
  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  // A method to restart the quiz
  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // Initializes the screen widget to the start screen.
    Widget screenWidget = StartScreen(_switchScreen);

    // Switches to the questions screen if active
    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    // Switches to the results screen if active
    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(251, 84, 231, 1),
                Color.fromRGBO(255, 126, 240, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget, // to rendering content conditionally
        ),
      ),
    );
  }
}
