// lib/screens/resume_screen.dart
import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question.dart';
import '../utils/app_theme.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  late List<ResumeItem> _items;

  @override
  void initState() {
    super.initState();
    _items = QuestionsData.resumeChecklist.map((e) => ResumeItem(
      id: e.id,
      title: e.title,
      description: e.description,
      isCompleted: e.isCompleted,
    )).toList();
  }

  int get completedCount => _items.where((e) => e.isCompleted).length;
  double get progress => _items.isEmpty ? 0 : completedCount / _items.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: const Color(0xFF7C3AED),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppTheme.gradientPurple, begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Resume Checklist', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 6),
                    Text('$completedCount of ${_items.length} completed', style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    const SizedBox(height: 14),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor: const AlwaysStoppedAnimation(Colors.white),
                        minHeight: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _buildProgressBanner(),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _ChecklistItem(
                  item: _items[index],
                  onToggle: (val) => setState(() => _items[index].isCompleted = val),
                ),
                childCount: _items.length,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: completedCount == _items.length
          ? FloatingActionButton.extended(
              backgroundColor: AppTheme.success,
              icon: const Icon(Icons.celebration_rounded, color: Colors.white),
              label: const Text('Resume Ready!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('🎉 Congratulations! Your resume is polished and ready!'),
                    backgroundColor: AppTheme.success,
                  ),
                );
              },
            )
          : null,
    );
  }

  Widget _buildProgressBanner() {
    if (progress == 1.0) {
      return Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppTheme.success, AppTheme.success.withOpacity(0.7)]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          children: [
            Text('🎉', style: TextStyle(fontSize: 28)),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Resume Complete!', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
                  Text('You\'ve checked all items. Good luck!', style: TextStyle(color: Colors.white70, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 16, 20, 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF7C3AED).withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF7C3AED).withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline_rounded, color: Color(0xFF7C3AED), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Check off each item to build a stellar resume. ${_items.length - completedCount} items remaining.',
              style: const TextStyle(fontSize: 13, color: Color(0xFF7C3AED), fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  final ResumeItem item;
  final Function(bool) onToggle;

  const _ChecklistItem({required this.item, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: item.isCompleted ? AppTheme.success.withOpacity(0.06) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.isCompleted ? AppTheme.success.withOpacity(0.3) : Colors.grey.shade200,
          width: 1.5,
        ),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => onToggle(!item.isCompleted),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: item.isCompleted ? AppTheme.success : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: item.isCompleted ? AppTheme.success : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: item.isCompleted
                    ? const Icon(Icons.check_rounded, color: Colors.white, size: 16)
                    : null,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: item.isCompleted ? AppTheme.success : AppTheme.textPrimary,
                        decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: item.isCompleted ? AppTheme.success.withOpacity(0.7) : AppTheme.textSecondary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
