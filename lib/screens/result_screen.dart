// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/app_theme.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String category;
  final List<bool> results;
  final List<Question> questions;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.category,
    required this.results,
    required this.questions,
  });

  double get percentage => (score / total) * 100;

  String get grade {
    if (percentage >= 90) return 'Excellent! 🏆';
    if (percentage >= 70) return 'Great Job! 🌟';
    if (percentage >= 50) return 'Good Effort! 👍';
    return 'Keep Practicing! 💪';
  }

  Color get gradeColor {
    if (percentage >= 90) return AppTheme.success;
    if (percentage >= 70) return AppTheme.primary;
    if (percentage >= 50) return AppTheme.warning;
    return AppTheme.error;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context)),
            SliverToBoxAdapter(child: _buildScoreCard()),
            SliverToBoxAdapter(child: _buildStatsRow()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                child: const Text('Review Answers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildReviewItem(index),
                childCount: questions.length,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: AppTheme.primary),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Home', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w600)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Try Again'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.popUntil(context, (r) => r.isFirst),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
              ),
              child: const Icon(Icons.home_rounded, size: 20, color: AppTheme.textPrimary),
            ),
          ),
          const SizedBox(width: 16),
          Text('Quiz Results', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildScoreCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradeColor, gradeColor.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: gradeColor.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        children: [
          Text(grade, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: percentage / 100,
                  strokeWidth: 10,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                ),
              ),
              Column(
                children: [
                  Text(
                    '$score/$total',
                    style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    '${percentage.toInt()}%',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            category,
            style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    final wrong = total - score;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: _StatBox(label: 'Correct', value: '$score', color: AppTheme.success, icon: Icons.check_circle_rounded)),
          const SizedBox(width: 12),
          Expanded(child: _StatBox(label: 'Wrong', value: '$wrong', color: AppTheme.error, icon: Icons.cancel_rounded)),
          const SizedBox(width: 12),
          Expanded(child: _StatBox(label: 'Score', value: '${percentage.toInt()}%', color: AppTheme.primary, icon: Icons.star_rounded)),
        ],
      ),
    );
  }

  Widget _buildReviewItem(int index) {
    final q = questions[index];
    final isCorrect = results[index];
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isCorrect ? AppTheme.success.withOpacity(0.3) : AppTheme.error.withOpacity(0.3)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
                  color: isCorrect ? AppTheme.success : AppTheme.error,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text('Q${index + 1}', style: TextStyle(color: isCorrect ? AppTheme.success : AppTheme.error, fontWeight: FontWeight.w700)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: (isCorrect ? AppTheme.success : AppTheme.error).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    isCorrect ? 'Correct' : 'Wrong',
                    style: TextStyle(fontSize: 11, color: isCorrect ? AppTheme.success : AppTheme.error, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(q.question, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary, height: 1.4)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.check_rounded, size: 14, color: AppTheme.success),
                const SizedBox(width: 4),
                Expanded(child: Text('${q.options[q.correctAnswerIndex]}', style: const TextStyle(fontSize: 13, color: AppTheme.success, fontWeight: FontWeight.w500))),
              ],
            ),
            const SizedBox(height: 8),
            Text(q.explanation, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.5)),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _StatBox({required this.label, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: 6),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: color)),
          Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
