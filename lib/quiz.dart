import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/home_screen.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/results_screen.dart';

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
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'home-screen';
    });
  }

  void chosenAnswer(String selectedAnswer) {
    selectedAnswers.add(selectedAnswer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreenWidget;

    switch (activeScreen) {
      case ('home-screen'):
        activeScreenWidget = HomeScreen(switchScreen);
        break;
      case ('question-screen'):
        activeScreenWidget = QuestionsScreen(
          onSelectedAnswer: chosenAnswer,
        );
        break;
      case ('results-screen'):
        activeScreenWidget = ResultsScreen(
            chosenAnswers: selectedAnswers, reStartQuiz: restartQuiz);
        break;
      default:
        activeScreenWidget = HomeScreen(switchScreen());
        break;
    }

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
