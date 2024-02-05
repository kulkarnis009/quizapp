import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/home_screen.dart';
import 'package:quizapp/questions_summary.dart';
import 'package:quizapp/quiz.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.reStartQuiz});

  final List<String> chosenAnswers;
  final void Function() reStartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(145, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: reStartQuiz,
              style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 15)),
              icon: const Icon(Icons.restart_alt),
              label: const Text(
                'Restart Quiz',
              ),
            )
          ],
        ),
      ),
    );
  }
}
