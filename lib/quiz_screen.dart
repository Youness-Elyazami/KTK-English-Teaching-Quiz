import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/models/answer.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/result_screen.dart';
import 'about_us_screen.dart';  

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with RestorationMixin {
  List<Question> _questions = [];
  final RestorableInt _currentQuestionIndex = RestorableInt(0);
  int _score = 0;
  bool _isAnswered = false;
  int _selectedAnswerIndex = -1;
  TextEditingController _controller = TextEditingController();  

  @override
  String? get restorationId => 'quiz_screen';

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final String response = await rootBundle.loadString('assets/questions.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _questions = data.map((json) => Question.fromJson(json)).toList();
    });
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentQuestionIndex, 'current_question_index');
  }

  @override
  void dispose() {
    _currentQuestionIndex.dispose();
    _controller.dispose();    
    super.dispose();
  }

  void _onAnswerSelected(int index) {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _selectedAnswerIndex = index;
        if (_questions[_currentQuestionIndex.value].answers[index].isCorrect) {
          _score++;
        }
      });
    }
  }

  void _onNextQuestion() {
    if (_currentQuestionIndex.value < _questions.length - 1) {
      setState(() {
        _isAnswered = false;
        _selectedAnswerIndex = -1;
        _currentQuestionIndex.value++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(score: _score, total: _questions.length)),
      );
    }
  }

  void _onPreviousQuestion() {
    if (_currentQuestionIndex.value > 0) {
      setState(() {
        _isAnswered = false;
        _selectedAnswerIndex = -1;
        _currentQuestionIndex.value--;
      });
    }
  }

 
  void _goToQuestion() {
    int? questionNumber = int.tryParse(_controller.text);
    if (questionNumber != null && questionNumber > 0 && questionNumber <= _questions.length) {
      setState(() {
        _isAnswered = false;
        _selectedAnswerIndex = -1;
        _currentQuestionIndex.value = questionNumber - 1;
      });
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a valid question number between 1 and ${_questions.length}')),
      );
    }
  }

  Color _getAnswerColor(int index) {
    if (!_isAnswered) {
      return Colors.white;
    }
    if (_questions[_currentQuestionIndex.value].answers[index].isCorrect) {
      return Color(0xFF94D1BE);  
    } else if (index == _selectedAnswerIndex) {
      return Color(0xFFE56857);  
    }
    return Colors.white; 
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        backgroundColor: Color(0xFFE1E9E5),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    Question currentQuestion = _questions[_currentQuestionIndex.value];
    double progress = (_currentQuestionIndex.value + 1) / _questions.length;

    return Scaffold(
      backgroundColor: Color(0xFFE1E9E5),
      resizeToAvoidBottomInset: true,  
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),  
        child: SafeArea(
          child: SingleChildScrollView(  
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,  
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Color(0xFF18392F)),
                          onPressed: _onPreviousQuestion,
                        ),
                        Text(
                          'Question ${_currentQuestionIndex.value + 1} of ${_questions.length}',
                          style: const TextStyle(fontSize: 18, fontFamily: 'LeagueSpartan'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.info_outline, color: Color(0xFF18392F)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutUsScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 12,
                        backgroundColor: Color(0xFF18392F),
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF94D1BE)),
                      ),
                    ),
                  ),
                   
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(fontFamily: 'LeagueSpartan'),
                            decoration: InputDecoration(
                              hintText: 'Enter question number',
                              hintStyle: const TextStyle(fontFamily: 'LeagueSpartan'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),  
                                borderSide: BorderSide(color: Color(0xFF18392F)),  
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Color(0xFF18392F)),  
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: _goToQuestion,
                          child: Text(
                            'Take me to Question',
                            style: const TextStyle(
                              fontFamily: 'LeagueSpartan',
                              color: Color(0xFF18392F),  
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,  
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),  
                            ),
                            side: BorderSide(color: Color(0xFF18392F)),  
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF3F4E5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                currentQuestion.question,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'LeagueSpartan',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: currentQuestion.answers.asMap().entries.map((entry) {
                              int idx = entry.key;
                              Answer answer = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  if (!_isAnswered) {
                                    _onAnswerSelected(idx);
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: _getAnswerColor(idx),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          answer.text,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'LeagueSpartan',
                                            color: _isAnswered && idx == _selectedAnswerIndex
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                      if (_isAnswered)
                                        Icon(
                                          answer.isCorrect
                                              ? Icons.check_circle_outline
                                              : (idx == _selectedAnswerIndex ? Icons.cancel : null),
                                          color: answer.isCorrect ? Colors.green : Colors.red[900],
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0, left: 16.0, right: 16.0),
                    child: ElevatedButton(
                      onPressed: _isAnswered ? _onNextQuestion : null,
                      child: Text(
                        _currentQuestionIndex == _questions.length - 1 ? 'Submit Quiz' : 'Next Question',
                        style: const TextStyle(
                          fontFamily: 'LeagueSpartan',
                          color: Colors.white,  
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF18392F),  
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),  
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
  