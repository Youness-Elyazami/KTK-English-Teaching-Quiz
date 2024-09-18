import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  ResultScreen({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
     int percentage = ((score / total) * 100).round();

    return Scaffold(
      backgroundColor: Color(0xFFE1E9E5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LeagueSpartan',
                  color: Color(0xFF18392F),
                ),
              ),
              SizedBox(height: 24),
              
               Image.asset(
                'assets/high.png',   
                height: 200,
              ),
              SizedBox(height: 24),

               Text(
                'Thank you for participating. Your score is:',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'LeagueSpartan',
                  color: Color(0xFF18392F),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LeagueSpartan',
                  color: Color(0xFF94D1BE),
                ),
              ),
              SizedBox(height: 32),

               ElevatedButton(
                onPressed: () {
                 
                  Navigator.pop(context);
                },
                child: Text(
                  'Restart',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'LeagueSpartan',
                    color: Color(0xFF18392F),  
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF94D1BE),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
