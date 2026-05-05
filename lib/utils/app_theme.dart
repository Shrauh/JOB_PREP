// lib/utils/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF1A73E8);
  static const Color primaryDark = Color(0xFF0D47A1);
  static const Color secondary = Color(0xFF00BFA5);
  static const Color accent = Color(0xFFFF6D00);
  static const Color background = Color(0xFFF8FAFF);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  static const List<Color> gradientBlue = [Color(0xFF1A73E8), Color(0xFF0D47A1)];
  static const List<Color> gradientGreen = [Color(0xFF00BFA5), Color(0xFF00796B)];
  static const List<Color> gradientOrange = [Color(0xFFFF6D00), Color(0xFFE65100)];
  static const List<Color> gradientPurple = [Color(0xFF7C3AED), Color(0xFF5B21B6)];

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
    );
  }
}

class AppConstants {
  static const List<String> jobCategories = [
    'Software Engineering',
    'Data Science',
    'Product Management',
    'Marketing',
    'Finance',
    'Human Resources',
  ];

  static const List<String> quizCategories = [
    'Aptitude',
    'Logical Reasoning',
    'Technical (DSA)',
    'English',
    'General Knowledge',
  ];
}
