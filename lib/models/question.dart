// lib/models/question.dart

class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final String category;
  final String difficulty;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.category,
    this.difficulty = 'Medium',
  });
}

class InterviewQuestion {
  final String id;
  final String question;
  final String answer;
  final String tips;
  final String category;

  InterviewQuestion({
    required this.id,
    required this.question,
    required this.answer,
    required this.tips,
    required this.category,
  });
}

class ResumeItem {
  final String id;
  final String title;
  final String description;
  bool isCompleted;

  ResumeItem({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });
}