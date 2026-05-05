// lib/screens/tips_screen.dart
import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  static const List<Map<String, dynamic>> tips = [
    {
      'category': 'Resume Tips',
      'emoji': '📄',
      'color': Color(0xFF7C3AED),
      'items': [
        {'title': 'Tailor Every Resume', 'body': 'Customize your resume for each job by matching keywords from the job description. ATS systems filter resumes automatically — matching keywords gets you past the first hurdle.'},
        {'title': 'Quantify Achievements', 'body': 'Instead of "Improved app performance," write "Improved app load time by 45%, boosting user retention by 20%." Numbers make your impact concrete and credible.'},
        {'title': 'Use Action Verbs', 'body': 'Start every bullet with strong verbs: Developed, Designed, Led, Implemented, Optimized, Analyzed, Achieved, Reduced, Increased, Launched.'},
        {'title': 'Keep It Concise', 'body': 'Freshers should have a 1-page resume. Experienced professionals: max 2 pages. Recruiters spend only 6-10 seconds on the first scan.'},
      ],
    },
    {
      'category': 'Interview Tips',
      'emoji': '🎤',
      'color': AppTheme.primary,
      'items': [
        {'title': 'Research the Company', 'body': 'Study the company\'s mission, products, recent news, competitors, and culture at least 2 hours before your interview. This helps you ask smart questions and show genuine interest.'},
        {'title': 'Practice Out Loud', 'body': 'Don\'t just think your answers — say them out loud. Record yourself answering common questions and review. First-time delivery is always rough.'},
        {'title': 'Use the STAR Method', 'body': 'For behavioral questions, structure your answers as: Situation → Task → Action → Result. This makes your answers clear, complete, and convincing.'},
        {'title': 'Prepare Smart Questions', 'body': 'Always ask 2-3 questions at the end: "What does success look like in this role?", "What are the biggest challenges the team faces?", "How do you measure performance?"'},
      ],
    },
    {
      'category': 'Job Search Strategy',
      'emoji': '🔍',
      'color': AppTheme.secondary,
      'items': [
        {'title': 'Apply Smart, Not Just Often', 'body': 'A targeted application to 10 well-researched companies beats 100 generic applications. Spend time crafting each cover letter and tailoring your resume.'},
        {'title': 'Leverage LinkedIn', 'body': 'Keep your LinkedIn updated, connect with recruiters, and comment on posts in your field. 85% of jobs are filled through networking — not job boards.'},
        {'title': 'Follow Up After Applying', 'body': 'After applying, find the hiring manager on LinkedIn and send a short, polite note expressing interest. This alone can set you apart from hundreds of other applicants.'},
        {'title': 'Track Your Applications', 'body': 'Maintain a spreadsheet with company name, role, date applied, status, and follow-up dates. Stay organized — you\'ll likely apply to 20-50+ positions.'},
      ],
    },
    {
      'category': 'Technical Preparation',
      'emoji': '💻',
      'color': Color(0xFF06B6D4),
      'items': [
        {'title': 'Focus on Fundamentals', 'body': 'Master Data Structures (Arrays, Trees, Graphs, Heaps) and Algorithms (Sorting, Searching, Dynamic Programming). These appear in 80% of technical interviews.'},
        {'title': 'Practice Daily on LeetCode', 'body': 'Solve at least 2-3 problems daily. Start with Easy, then Medium, then Hard. Focus on understanding patterns, not memorizing solutions.'},
        {'title': 'Study System Design', 'body': 'For senior roles, learn how to design scalable systems. Study concepts like load balancing, caching, databases, and microservices architecture.'},
        {'title': 'Know Your Projects Deeply', 'body': 'Be ready to discuss every project on your resume in depth: architecture decisions, challenges faced, what you\'d do differently, and the impact it created.'},
      ],
    },
    {
      'category': 'Soft Skills & Communication',
      'emoji': '🗣️',
      'color': AppTheme.accent,
      'items': [
        {'title': 'Active Listening', 'body': 'Interviewers notice when you listen carefully vs. when you\'re waiting to talk. Pause, think, and answer the question asked — not the one you prepared for.'},
        {'title': 'Manage Interview Anxiety', 'body': 'Nervousness is normal. Take 3 deep breaths before entering. Remember: the interviewer wants you to succeed — they\'re hoping you\'re the right person for the role.'},
        {'title': 'Body Language Matters', 'body': 'Sit up straight, maintain eye contact (not staring), smile naturally, and avoid crossing your arms. In video interviews, position your camera at eye level and look at the camera, not your screen.'},
        {'title': 'Send a Thank-You Email', 'body': 'Within 24 hours of your interview, send a thank-you email to each interviewer. Mention one specific topic from the conversation to make it personal and memorable.'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            backgroundColor: const Color(0xFFEC4899),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFFEC4899), Color(0xFFBE185D)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 16),
                child: const Text('Career Tips & Guides', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _TipsSection(section: tips[index]),
                childCount: tips.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

class _TipsSection extends StatelessWidget {
  final Map<String, dynamic> section;

  const _TipsSection({required this.section});

  @override
  Widget build(BuildContext context) {
    final color = section['color'] as Color;
    final items = section['items'] as List;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12, top: 8),
          child: Row(
            children: [
              Text(section['emoji'] as String, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 10),
              Text(section['category'] as String,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: color)),
            ],
          ),
        ),
        ...items.map((item) => _TipItem(item: item as Map<String, dynamic>, color: color)),
        const SizedBox(height: 12),
      ],
    );
  }
}

class _TipItem extends StatefulWidget {
  final Map<String, dynamic> item;
  final Color color;

  const _TipItem({required this.item, required this.color});

  @override
  State<_TipItem> createState() => _TipItemState();
}

class _TipItemState extends State<_TipItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(width: 4, height: 18, decoration: BoxDecoration(color: widget.color, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(width: 10),
                  Expanded(child: Text(widget.item['title'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.textPrimary))),
                  Icon(_expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded, color: AppTheme.textSecondary, size: 20),
                ],
              ),
              if (_expanded) ...[
                const SizedBox(height: 12),
                Text(widget.item['body'] as String, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.6)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
