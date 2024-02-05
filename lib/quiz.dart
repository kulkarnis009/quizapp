import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/home_screen.dart';
import 'package:quizapp/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chosenAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'home-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var activeScreenWidget = activeScreen == 'home-screen'
        ? HomeScreen(switchScreen)
        : QuestionsScreen(
            onSelectedAnswer: chosenAnswer,
          );

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 17, 60, 68),
                Color.fromARGB(255, 66, 98, 104)
              ]),
        ),
        child: Center(
          child: activeScreenWidget,
        ),
      ),
    ));
  }
}
