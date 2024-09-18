import 'package:flutter/material.dart';
import 'quiz_screen.dart'; 

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1E9E5),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/logoblack.png', height: 170, width: 250),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 2.0),
              child: Text(
                'Some english learners are destined to be English teachers',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
              child: const Text('Start'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF94D1BE),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/question.png', height: 300),
            ),
          ],
        ),
      ),
    );
  }
}
