import 'package:flutter/material.dart';

/// Centralized color constants for the e-learning app.
///
/// Uses a black-and-white visual identity consistently.
/// Do not introduce random accent colors or gradients.
class AppColors {
  AppColors._();

  // ──────────────────────────────────────────
  // Core Palette
  // ──────────────────────────────────────────

  /// Main background color for scaffolds and pages.
  static const Color background = Color(0xFFFAFAFA);

  /// Primary brand color (dark black).
  static const Color primary = Color(0xFF151515);

  /// Surface color for cards, containers, and elevated elements.
  static const Color surface = Color(0xFFFFFFFF);

  // ──────────────────────────────────────────
  // Text Colors
  // ──────────────────────────────────────────

  /// Primary text color for headings and important labels.
  static const Color textPrimary = Color(0xFF151515);

  /// Secondary text color for descriptions, subtitles, and hints.
  static const Color textSecondary = Color(0xFF777777);

  // ──────────────────────────────────────────
  // Borders & Dividers
  // ──────────────────────────────────────────

  /// Border color for input fields, cards, and containers.
  static const Color border = Color(0xFFE0E0E0);

  /// Divider color for separating sections.
  static const Color divider = Color(0xFFE0E0E0);

  // ──────────────────────────────────────────
  // State Colors
  // ──────────────────────────────────────────

  /// Disabled state color for buttons and interactive elements.
  static const Color disabled = Color(0xFFBDBDBD);

  /// Error state color for validation messages and error indicators.
  static const Color error = Color(0xFFD32F2F);

  /// Success state color for positive feedback and confirmations.
  static const Color success = Color(0xFF2E7D32);

  // ──────────────────────────────────────────
  // Header & Decorative (existing design elements)
  // ──────────────────────────────────────────

  /// Dark color used in the curved header painter.
  static const Color headerDark = Color(0xFF151515);

  /// Decorative stroke color used in header curves.
  static const Color headerStroke = Color(0xFF555555);

  /// Decorative circle color in header.
  static const Color headerCircle = Color(0xFF1D1D1D);

  // ──────────────────────────────────────────
  // Banner & Card Dark Shades
  // ──────────────────────────────────────────

  /// Dark background for banners and promotional cards.
  static const Color bannerBackground = Color(0xFF111111);

  /// Secondary dark shade for banner decorations.
  static const Color bannerAccent = Color(0xFF3A3A3A);

  /// Badge/chip dark background.
  static const Color chipBackground = Color(0xFF333333);

  /// Light muted text on dark backgrounds.
  static const Color textOnDarkMuted = Color(0xFFCCCCCC);

  // ──────────────────────────────────────────
  // Icon Colors
  // ──────────────────────────────────────────

  /// Icon color for input field icons and secondary icons.
  static const Color iconSecondary = Color(0xFF555555);

  /// Hint text color for input fields.
  static const Color hintText = Color(0xFF8A8A8A);
}
