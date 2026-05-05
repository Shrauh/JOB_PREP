// lib/screens/daily_challenge_screen.dart
import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../utils/app_theme.dart';
import 'quiz_screen.dart';

class DailyChallengeScreen extends StatelessWidget {
  const DailyChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mix questions from all categories for daily challenge
    final allQuestions = [
      ...QuestionsData.aptitudeQuestions.take(2),
      ...QuestionsData.logicalQuestions.take(2),
      ...QuestionsData.technicalQuestions.take(2),
      ...QuestionsData.englishQuestions.take(2),
      ...QuestionsData.gkQuestions.take(2),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)]),
                      child: const Icon(Icons.arrow_back_rounded, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: AppTheme.gradientOrange, begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: AppTheme.accent.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
                ),
                child: Column(
                  children: [
                    const Text('⚡', style: TextStyle(fontSize: 56)),
                    const SizedBox(height: 16),
                    const Text('Daily Challenge', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    const Text('Test your knowledge across all topics!', style: TextStyle(color: Colors.white70, fontSize: 14), textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(30)),
                      child: const Text('🏆  +50 XP on completion', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text('Today\'s Challenge Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
              const SizedBox(height: 16),
              _DetailRow(icon: Icons.quiz_rounded, label: 'Questions', value: '10 Mixed Questions'),
              _DetailRow(icon: Icons.timer_rounded, label: 'Time', value: '30 sec per question'),
              _DetailRow(icon: Icons.category_rounded, label: 'Topics', value: 'All 5 Categories'),
              _DetailRow(icon: Icons.star_rounded, label: 'Difficulty', value: 'Easy to Medium'),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(
                          category: 'Daily Challenge',
                          questions: allQuestions,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.accent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Start Challenge ⚡', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text('Resets every day at midnight', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppTheme.accent.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: AppTheme.accent, size: 20),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
            ],
          ),
        ],
      ),
    );
  }
}
