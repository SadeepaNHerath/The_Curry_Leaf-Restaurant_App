import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primaryColor = Color(0xFF27B832);
  static const primaryDarkColor =
      Color(0xFF148224);
  static final secondaryColor = Colors.grey[800]!;
  static const accentColor = Color(0xFFFFA726);

  static final scaffoldBackgroundColor = Colors.grey[100]!;
  static const cardColor = Colors.white;

  static final textPrimaryColor = Colors.grey[800]!;
  static final textSecondaryColor = Colors.grey[600]!;
  static const textOnPrimaryColor = Colors.white;

  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultRadius = 16.0;
  static const double smallRadius = 8.0;
  static const double largeRadius = 24.0;

  static const Duration defaultDuration = Duration(milliseconds: 300);

  static List<BoxShadow> defaultShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> lightShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.dmSerifDisplay(
      color: textPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.dmSerifDisplay(
      color: textPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.dmSerifDisplay(
      color: textPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.dmSerifDisplay(
      color: textPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.poppins(
      color: textPrimaryColor,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: textPrimaryColor,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: textSecondaryColor,
    ),
  );

  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: textOnPrimaryColor,
    padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding * 1.5, vertical: defaultPadding),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    elevation: 4,
  );

  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: textTheme.titleLarge?.copyWith(color: textPrimaryColor),
      iconTheme: IconThemeData(color: textPrimaryColor),
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: primaryButtonStyle,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
      secondary: accentColor,
    ),
  );
}
