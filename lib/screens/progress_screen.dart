// lib/screens/progress_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../widgets/common_widgets.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 20, 20, 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Color(0xFF1A1A2E), Color(0xFF16213E)]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('My Progress', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 6),
                  const Text('Track your preparation journey', style: TextStyle(color: Colors.white54, fontSize: 14)),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _HeroStat(value: '48', label: 'Questions\nAttempted', icon: Icons.help_rounded),
                        _VerticalDivider(),
                        _HeroStat(value: '78%', label: 'Overall\nAccuracy', icon: Icons.gps_fixed_rounded),
                        _VerticalDivider(),
                        _HeroStat(value: '3', label: 'Day\nStreak', icon: Icons.local_fire_department_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SectionHeader(title: 'Category Performance'),
                const SizedBox(height: 16),
                _buildCategoryPerformance(),
                const SizedBox(height: 28),
                const SectionHeader(title: 'Weekly Activity'),
                const SizedBox(height: 16),
                _buildWeeklyActivity(),
                const SizedBox(height: 28),
                const SectionHeader(title: 'Achievements'),
                const SizedBox(height: 16),
                _buildAchievements(),
                const SizedBox(height: 28),
                const SectionHeader(title: 'Study Milestones'),
                const SizedBox(height: 16),
                _buildMilestones(),
                const SizedBox(height: 80),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPerformance() {
    final categories = [
      {'name': 'Aptitude', 'score': 0.85, 'color': AppTheme.primary, 'qs': '7/8'},
      {'name': 'Logical Reasoning', 'score': 0.67, 'color': AppTheme.accent, 'qs': '4/6'},
      {'name': 'Technical (DSA)', 'score': 0.75, 'color': const Color(0xFF06B6D4), 'qs': '6/8'},
      {'name': 'English', 'score': 0.80, 'color': AppTheme.secondary, 'qs': '4/5'},
      {'name': 'General Knowledge', 'score': 0.60, 'color': const Color(0xFF7C3AED), 'qs': '3/5'},
    ];

    return Column(
      children: categories.map((cat) {
        final color = cat['color'] as Color;
        final score = cat['score'] as double;
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cat['name'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                  Row(
                    children: [
                      Text(cat['qs'] as String, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w700)),
                      const SizedBox(width: 8),
                      Text('${(score * 100).toInt()}%', style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: score,
                  backgroundColor: color.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation(color),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildWeeklyActivity() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final activity = [8, 12, 5, 15, 10, 3, 0];
    final maxActivity = activity.reduce((a, b) => a > b ? a : b);
    final today = 4; // Thursday

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(days.length, (i) {
              final height = maxActivity == 0 ? 0.0 : (activity[i] / maxActivity) * 80.0;
              final isToday = i == today;
              return Column(
                children: [
                  Text(
                    '${activity[i]}',
                    style: TextStyle(fontSize: 10, color: isToday ? AppTheme.primary : AppTheme.textSecondary, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300 + i * 50),
                    width: 28,
                    height: height == 0 ? 4 : height,
                    decoration: BoxDecoration(
                      color: isToday ? AppTheme.primary : (activity[i] == 0 ? Colors.grey.shade200 : AppTheme.primary.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(days[i], style: TextStyle(fontSize: 11, color: isToday ? AppTheme.primary : AppTheme.textSecondary, fontWeight: isToday ? FontWeight.w700 : FontWeight.w500)),
                ],
              );
            }),
          ),
          const SizedBox(height: 14),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _WeeklyStat(label: 'This Week', value: '53 Qs', color: AppTheme.primary),
              _WeeklyStat(label: 'Best Day', value: '15 Qs', color: AppTheme.success),
              _WeeklyStat(label: 'Avg/Day', value: '7.6 Qs', color: AppTheme.accent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievements() {
    final achievements = [
      {'title': 'First Quiz', 'desc': 'Completed your first quiz', 'icon': '🎯', 'unlocked': true},
      {'title': '3-Day Streak', 'desc': 'Studied 3 days in a row', 'icon': '🔥', 'unlocked': true},
      {'title': 'Aptitude Ace', 'desc': 'Scored 80%+ in Aptitude', 'icon': '🧮', 'unlocked': true},
      {'title': 'Perfect Score', 'desc': 'Get 100% in any quiz', 'icon': '🏆', 'unlocked': false},
      {'title': 'Interview Ready', 'desc': 'Read all interview Q&As', 'icon': '🎤', 'unlocked': false},
      {'title': '7-Day Streak', 'desc': 'Study for 7 consecutive days', 'icon': '⚡', 'unlocked': false},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final item = achievements[index];
        final unlocked = item['unlocked'] as bool;
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: unlocked ? Colors.white : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: unlocked ? AppTheme.warning.withOpacity(0.4) : Colors.grey.shade200),
            boxShadow: unlocked ? [BoxShadow(color: AppTheme.warning.withOpacity(0.15), blurRadius: 8)] : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item['icon'] as String,
                style: TextStyle(fontSize: 28, color: unlocked ? null : null),
              ),
              if (!unlocked) ...[
                const SizedBox(height: 2),
                const Icon(Icons.lock_rounded, size: 10, color: Colors.grey),
              ],
              const SizedBox(height: 8),
              Text(
                item['title'] as String,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: unlocked ? AppTheme.textPrimary : Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                item['desc'] as String,
                style: TextStyle(fontSize: 9, color: unlocked ? AppTheme.textSecondary : Colors.grey.shade400),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMilestones() {
    final milestones = [
      {'title': 'Complete 100 Questions', 'progress': 0.48, 'current': 48, 'target': 100, 'color': AppTheme.primary},
      {'title': 'Read All Interview Q&As', 'progress': 0.5, 'current': 5, 'target': 10, 'color': AppTheme.secondary},
      {'title': 'Complete Resume Checklist', 'progress': 0.25, 'current': 3, 'target': 12, 'color': const Color(0xFF7C3AED)},
      {'title': 'Achieve 7-Day Streak', 'progress': 0.43, 'current': 3, 'target': 7, 'color': AppTheme.accent},
    ];

    return Column(
      children: milestones.map((m) {
        final color = m['color'] as Color;
        final progress = m['progress'] as double;
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 4,
                      backgroundColor: color.withOpacity(0.15),
                      valueColor: AlwaysStoppedAnimation(color),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m['title'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
                    const SizedBox(height: 4),
                    Text('${m['current']} / ${m['target']} completed', style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _HeroStat({required this.value, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white54, size: 20),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11, height: 1.3), textAlign: TextAlign.center),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 50, color: Colors.white.withOpacity(0.15));
  }
}

class _WeeklyStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _WeeklyStat({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: color)),
        Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
      ],
    );
  }
}
