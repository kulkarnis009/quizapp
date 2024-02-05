import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(children: [
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: data['user_answer'] == data['correct_answer']
                        ? const Color.fromARGB(255, 21, 152, 0)
                        : const Color.fromARGB(255, 246, 20, 16)),
                child: Center(
                    child:
                        Text(((data['question_index'] as int) + 1).toString())),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Text(
                        data['question'] as String,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Selected Answer: ${data['user_answer'] as String}',
                        style: const TextStyle(color: Colors.pink),
                      ),
                      Text(
                        'Correct Answer: ${data['correct_answer'] as String}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ]),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
