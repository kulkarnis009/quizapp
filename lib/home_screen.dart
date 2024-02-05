import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 200,
        ),
        const Image(
          image: AssetImage('assets/images/quiz-logo.png'),
          height: 200,
          color: Color.fromARGB(174, 255, 255, 255),
        ),
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 100,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
              side: BorderSide.none,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 15)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
        const Spacer(),
        const Text(
          'Developed by Saurabh',
          style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
              fontSize: 15),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
