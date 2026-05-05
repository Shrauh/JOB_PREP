// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/common_widgets.dart';
import 'quiz_category_screen.dart';
import 'interview_screen.dart';
import 'resume_screen.dart';
import 'tips_screen.dart';
import 'progress_screen.dart';
import 'daily_challenge_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeTab(),
    const QuizCategoryScreen(),
    const InterviewScreen(),
    const ProgressScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(index: 0, icon: Icons.home_rounded, label: 'Home', currentIndex: _currentIndex, onTap: (i) => setState(() => _currentIndex = i)),
                _NavItem(index: 1, icon: Icons.quiz_rounded, label: 'Quiz', currentIndex: _currentIndex, onTap: (i) => setState(() => _currentIndex = i)),
                _NavItem(index: 2, icon: Icons.record_voice_over_rounded, label: 'Interview', currentIndex: _currentIndex, onTap: (i) => setState(() => _currentIndex = i)),
                _NavItem(index: 3, icon: Icons.bar_chart_rounded, label: 'Progress', currentIndex: _currentIndex, onTap: (i) => setState(() => _currentIndex = i)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final int currentIndex;
  final Function(int) onTap;

  const _NavItem({
    required this.index,
    required this.icon,
    required this.label,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? AppTheme.primary : AppTheme.textSecondary, size: 24),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                color: isActive ? AppTheme.primary : AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── HOME TAB ───────────────────────────────────────────────────────────────
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeader(context)),
          SliverToBoxAdapter(child: _buildDailyChallenge(context)),
          SliverToBoxAdapter(child: _buildQuickStats()),
          SliverToBoxAdapter(child: _buildMainFeatures(context)),
          SliverToBoxAdapter(child: _buildTipsSection(context)),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppTheme.gradientBlue,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Good Morning! 👋',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Ready to Prep Today?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.notifications_rounded, color: Colors.white, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: const [
                Icon(Icons.local_fire_department_rounded, color: Colors.orange, size: 22),
                SizedBox(width: 8),
                Text(
                  '3-Day Streak! Keep it going 🔥',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyChallenge(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GradientCard(
        gradient: AppTheme.gradientOrange,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DailyChallengeScreen())),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '⚡ Daily Challenge',
                    style: TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Take today\'s quiz\nand earn points!',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.timer_rounded, color: Colors.white70, size: 16),
                      SizedBox(width: 4),
                      Text('10 Questions · 15 min', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 36),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          Expanded(child: StatCard(value: '48', label: 'Questions Done', icon: Icons.check_circle_rounded, color: AppTheme.success)),
          const SizedBox(width: 12),
          Expanded(child: StatCard(value: '78%', label: 'Accuracy', icon: Icons.track_changes_rounded, color: AppTheme.primary)),
          const SizedBox(width: 12),
          Expanded(child: StatCard(value: '3', label: 'Day Streak', icon: Icons.local_fire_department_rounded, color: AppTheme.accent)),
        ],
      ),
    );
  }

  Widget _buildMainFeatures(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Prepare By Topic'),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
            children: [
              CategoryCard(
                title: 'Aptitude',
                subtitle: '8 Questions',
                icon: Icons.calculate_rounded,
                gradient: AppTheme.gradientBlue,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizCategoryScreen())),
              ),
              CategoryCard(
                title: 'Interview',
                subtitle: '10 Q&A',
                icon: Icons.record_voice_over_rounded,
                gradient: AppTheme.gradientGreen,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InterviewScreen())),
              ),
              CategoryCard(
                title: 'Resume',
                subtitle: 'Checklist',
                icon: Icons.description_rounded,
                gradient: AppTheme.gradientPurple,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ResumeScreen())),
              ),
              CategoryCard(
                title: 'Reasoning',
                subtitle: '6 Questions',
                icon: Icons.psychology_rounded,
                gradient: AppTheme.gradientOrange,
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizCategoryScreen())),
              ),
              CategoryCard(
                title: 'Technical',
                subtitle: '8 Questions',
                icon: Icons.code_rounded,
                gradient: [const Color(0xFF06B6D4), const Color(0xFF0891B2)],
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizCategoryScreen())),
              ),
              CategoryCard(
                title: 'Career Tips',
                subtitle: 'Articles',
                icon: Icons.lightbulb_rounded,
                gradient: [const Color(0xFFEC4899), const Color(0xFFBE185D)],
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TipsScreen())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Quick Tips',
            actionText: 'See All',
            onAction: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TipsScreen())),
          ),
          const SizedBox(height: 16),
          _TipCard(
            title: 'Master the STAR Method',
            description: 'Use Situation, Task, Action, Result format for all behavioral interview answers.',
            icon: '⭐',
            color: AppTheme.primary,
          ),
          const SizedBox(height: 10),
          _TipCard(
            title: 'Research Before Interview',
            description: 'Study the company\'s products, culture, recent news, and job description thoroughly.',
            icon: '🔍',
            color: AppTheme.secondary,
          ),
          const SizedBox(height: 10),
          _TipCard(
            title: 'Quantify Your Achievements',
            description: 'Always add numbers to your resume points — "Improved speed by 40%, saved ₹2L".',
            icon: '📊',
            color: AppTheme.accent,
          ),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final Color color;

  const _TipCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 22))),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary)),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
