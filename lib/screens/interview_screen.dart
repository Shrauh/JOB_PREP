// lib/screens/interview_screen.dart
import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question.dart';
import '../utils/app_theme.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({super.key});

  @override
  State<InterviewScreen> createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = ['All', 'HR Round', 'Technical Round', 'Behavioral Round'];
  String _selectedCategory = 'All';

  List<InterviewQuestion> get filteredQuestions {
    if (_selectedCategory == 'All') return QuestionsData.interviewQuestions;
    return QuestionsData.interviewQuestions.where((q) => q.category == _selectedCategory).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() => _selectedCategory = tabs[_tabController.index]);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            backgroundColor: AppTheme.secondary,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppTheme.gradientGreen, begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Interview Prep', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 6),
                    Text('${QuestionsData.interviewQuestions.length} curated Q&A with expert tips',
                        style: const TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  labelColor: AppTheme.primary,
                  unselectedLabelColor: AppTheme.textSecondary,
                  indicatorColor: AppTheme.primary,
                  indicatorWeight: 3,
                  tabs: tabs.map((t) => Tab(text: t)).toList(),
                ),
              ),
            ),
          ),
        ],
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filteredQuestions.length,
          itemBuilder: (context, index) => _InterviewCard(
            question: filteredQuestions[index],
            questionNumber: index + 1,
          ),
        ),
      ),
    );
  }
}

class _InterviewCard extends StatefulWidget {
  final InterviewQuestion question;
  final int questionNumber;

  const _InterviewCard({required this.question, required this.questionNumber});

  @override
  State<_InterviewCard> createState() => _InterviewCardState();
}

class _InterviewCardState extends State<_InterviewCard> {
  bool _isExpanded = false;
  bool _showTips = false;

  Color get _categoryColor {
    switch (widget.question.category) {
      case 'HR Round':
        return AppTheme.primary;
      case 'Technical Round':
        return const Color(0xFF06B6D4);
      case 'Behavioral Round':
        return AppTheme.accent;
      default:
        return AppTheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          // Header
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _categoryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${widget.questionNumber}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: _categoryColor),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: _categoryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.question.category,
                              style: TextStyle(fontSize: 10, color: _categoryColor, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.question.question,
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textPrimary, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: const Icon(Icons.keyboard_arrow_down_rounded, color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Expanded Content
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: _buildExpandedContent(),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 12),
          const Row(
            children: [
              Icon(Icons.record_voice_over_rounded, size: 16, color: AppTheme.primary),
              SizedBox(width: 6),
              Text('Model Answer', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.primary)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.primary.withOpacity(0.15)),
            ),
            child: Text(
              widget.question.answer,
              style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary, height: 1.6),
            ),
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => setState(() => _showTips = !_showTips),
            child: Row(
              children: [
                const Icon(Icons.lightbulb_rounded, size: 16, color: AppTheme.warning),
                const SizedBox(width: 6),
                Text(
                  _showTips ? 'Hide Tips' : 'Show Expert Tips',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.warning),
                ),
                const Spacer(),
                Icon(_showTips ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: AppTheme.warning, size: 18),
              ],
            ),
          ),
          if (_showTips) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.warning.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.warning.withOpacity(0.3)),
              ),
              child: Text(
                widget.question.tips,
                style: const TextStyle(fontSize: 13, color: AppTheme.textPrimary, height: 1.8),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
