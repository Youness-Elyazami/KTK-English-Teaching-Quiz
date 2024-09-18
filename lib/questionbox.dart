import 'package:flutter/material.dart';
import 'answerbox.dart';

class QuestionBox extends StatelessWidget {
  final String question;
  final List<String> answers;

  const QuestionBox({
    super.key,
    required this.question,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...answers.map((answer) => AnswerBox(
            answerText: answer,
            onPressed: () {},
          )).toList(),
        ],
      ),
    );
  }
}
