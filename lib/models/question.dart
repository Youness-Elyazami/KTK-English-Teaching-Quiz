import 'answer.dart';

class Question {
  final String question;
  final List<Answer> answers;

  Question({required this.question, required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    List<dynamic> answerList = json['answers'];
    List<Answer> answers = answerList.map((answerJson) => Answer.fromJson(answerJson)).toList();
    return Question(
      question: json['question'],
      answers: answers,
    );
  }
}
