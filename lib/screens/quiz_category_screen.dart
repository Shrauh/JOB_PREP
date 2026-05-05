// lib/screens/quiz_category_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../data/questions_data.dart';
import 'quiz_screen.dart';

class QuizCategoryScreen extends StatelessWidget {
  const QuizCategoryScreen({super.key});

  static const List<Map<String, dynamic>> categories = [
    {
      'title': 'Aptitude',
      'subtitle': '8 questions · Math & Logic',
      'icon': Icons.calculate_rounded,
      'gradient': AppTheme.gradientBlue,
      'questions': '8',
      'time': '10 min',
    },
    {
      'title': 'Logical Reasoning',
      'subtitle': '6 questions · Pattern & Inference',
      'icon': Icons.psychology_rounded,
      'gradient': AppTheme.gradientOrange,
      'questions': '6',
      'time': '8 min',
    },
    {
      'title': 'Technical (DSA)',
      'subtitle': '8 questions · CS Fundamentals',
      'icon': Icons.code_rounded,
      'gradient': [Color(0xFF06B6D4), Color(0xFF0891B2)],
      'questions': '8',
      'time': '10 min',
    },
    {
      'title': 'English',
      'subtitle': '5 questions · Grammar & Vocabulary',
      'icon': Icons.menu_book_rounded,
      'gradient': AppTheme.gradientGreen,
      'questions': '5',
      'time': '6 min',
    },
    {
      'title': 'General Knowledge',
      'subtitle': '5 questions · Current Affairs & GK',
      'icon': Icons.public_rounded,
      'gradient': AppTheme.gradientPurple,
      'questions': '5',
      'time': '6 min',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: AppTheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Practice Quiz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppTheme.gradientBlue, begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Icon(Icons.quiz_rounded, color: Colors.white54, size: 60),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choose a Category',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Test your knowledge and improve your score',
                          style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                  final cat = categories[index - 1];
                  return _CategoryListItem(category: cat, onTap: () {
                    // To this:
                    final questions = QuestionsData.getByCategory(cat['title'] as String);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(
                          category: cat['title'] as String,
                          questions: questions,
                        ),
                      ),
                    );
                  });
                },
                childCount: categories.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryListItem extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const _CategoryListItem({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final gradient = category['gradient'] as List<Color>;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(category['icon'] as IconData, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category['title'] as String,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        category['subtitle'] as String,
                        style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          _Chip(label: '${category['questions']} Qs', icon: Icons.help_outline_rounded, color: gradient.first),
                          const SizedBox(width: 8),
                          _Chip(label: category['time'] as String, icon: Icons.timer_rounded, color: gradient.first),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppTheme.textSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _Chip({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
