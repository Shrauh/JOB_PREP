// lib/screens/quiz_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question.dart';
import '../utils/app_theme.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String category;
  final List<Question> questions;

  const QuizScreen({super.key, required this.category, required this.questions});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int? _selectedAnswer;
  bool _isAnswered = false;
  int _score = 0;
  List<bool> _results = [];

  int _timeLeft = 30;
  Timer? _timer;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _startTimer();
  }

  void _startTimer() {
    _timeLeft = 30;
    _progressController.reset();
    _progressController.forward();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() => _timeLeft--);
      if (_timeLeft <= 0) {
        t.cancel();
        _handleTimeout();
      }
    });
  }

  void _handleTimeout() {
    if (!_isAnswered) {
      setState(() {
        _isAnswered = true;
        _results.add(false);
      });
    }
  }

  void _selectAnswer(int index) {
    if (_isAnswered) return;
    _timer?.cancel();
    final isCorrect = index == widget.questions[_currentIndex].correctAnswerIndex;
    setState(() {
      _selectedAnswer = index;
      _isAnswered = true;
      if (isCorrect) _score++;
      _results.add(isCorrect);
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _isAnswered = false;
      });
      _startTimer();
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: _score,
            total: widget.questions.length,
            category: widget.category,
            results: _results,
            questions: widget.questions,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_currentIndex];
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTimerBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildQuestion(q),
                    const SizedBox(height: 24),
                    ...List.generate(q.options.length, (i) => _buildOption(i, q)),
                    if (_isAnswered) _buildExplanation(q),
                  ],
                ),
              ),
            ),
            if (_isAnswered) _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _showExitDialog(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
              ),
              child: const Icon(Icons.close_rounded, size: 20, color: AppTheme.textPrimary),
            ),
          ),
          Column(
            children: [
              Text(
                widget.category,
                style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, fontWeight: FontWeight.w500),
              ),
              Text(
                'Q ${_currentIndex + 1} / ${widget.questions.length}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.star_rounded, size: 16, color: AppTheme.success),
                const SizedBox(width: 4),
                Text('$_score', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.success)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time Left', style: TextStyle(fontSize: 12, color: _timeLeft <= 10 ? AppTheme.error : AppTheme.textSecondary)),
              Text(
                '$_timeLeft s',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: _timeLeft <= 10 ? AppTheme.error : AppTheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: AnimatedBuilder(
              animation: _progressController,
              builder: (_, __) => LinearProgressIndicator(
                value: _timeLeft / 30,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation(
                  _timeLeft <= 10 ? AppTheme.error : AppTheme.primary,
                ),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(Question q) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(q.difficulty, style: const TextStyle(fontSize: 11, color: AppTheme.primary, fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 14),
          Text(
            q.question,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppTheme.textPrimary, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(int index, Question q) {
    Color borderColor = Colors.grey.shade200;
    Color bgColor = Colors.white;
    Color textColor = AppTheme.textPrimary;
    Widget? trailing;

    if (_isAnswered) {
      if (index == q.correctAnswerIndex) {
        borderColor = AppTheme.success;
        bgColor = AppTheme.success.withOpacity(0.08);
        textColor = AppTheme.success;
        trailing = const Icon(Icons.check_circle_rounded, color: AppTheme.success, size: 22);
      } else if (index == _selectedAnswer) {
        borderColor = AppTheme.error;
        bgColor = AppTheme.error.withOpacity(0.08);
        textColor = AppTheme.error;
        trailing = const Icon(Icons.cancel_rounded, color: AppTheme.error, size: 22);
      }
    }

    return GestureDetector(
      onTap: () => _selectAnswer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: borderColor.withOpacity(0.15),
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: 1.5),
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: textColor),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                q.options[index],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation(Question q) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.success.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('💡', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Explanation', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppTheme.success)),
                const SizedBox(height: 4),
                Text(q.explanation, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    final isLast = _currentIndex == widget.questions.length - 1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _nextQuestion,
          child: Text(isLast ? 'View Results' : 'Next Question'),
        ),
      ),
    );
  }

  void _showExitDialog() {
    _timer?.cancel();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Exit Quiz?', style: TextStyle(fontWeight: FontWeight.w700)),
        content: const Text('Your progress will be lost.'),
        actions: [
          TextButton(onPressed: () { Navigator.pop(context); _startTimer(); }, child: const Text('Continue')),
          ElevatedButton(
            onPressed: () { Navigator.pop(context); Navigator.pop(context); },
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.error),
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}
