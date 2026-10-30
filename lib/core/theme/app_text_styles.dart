import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elearning/core/constants/app_colors.dart';

/// Centralized text style definitions for the e-learning app.
///
/// All styles use the Poppins font family via Google Fonts.
/// Headings are visually strong, descriptions readable, buttons consistent.
class AppTextStyles {
  AppTextStyles._();

  // ──────────────────────────────────────────
  // Display
  // ──────────────────────────────────────────

  /// 32px, bold — for hero sections and display text.
  static TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.25,
    letterSpacing: -0.5,
  );

  // ──────────────────────────────────────────
  // Headlines
  // ──────────────────────────────────────────

  /// 28px, bold — for page titles and major headings.
  static TextStyle headlineLarge = GoogleFonts.poppins(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -0.5,
  );

  /// 24px, bold — for section headings.
  static TextStyle headlineMedium = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // ──────────────────────────────────────────
  // Titles
  // ──────────────────────────────────────────

  /// 20px, semi-bold — for card titles and sub-sections.
  static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  /// 18px, semi-bold — for smaller titles and emphasis text.
  static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // ──────────────────────────────────────────
  // Body
  // ──────────────────────────────────────────

  /// 16px, regular — for primary body text.
  static TextStyle bodyLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 14px, regular — for secondary body text and descriptions.
  static TextStyle bodyMedium = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// 12px, regular — for captions, timestamps, and small labels.
  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // ──────────────────────────────────────────
  // Labels
  // ──────────────────────────────────────────

  /// 16px, semi-bold — for buttons and action labels.
  static TextStyle labelLarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );
}
