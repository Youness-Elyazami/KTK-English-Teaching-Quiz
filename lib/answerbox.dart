import 'package:flutter/material.dart';

class AnswerBox extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;

  const AnswerBox({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.lightBlue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(answerText),
      ),
    );
  }
}
