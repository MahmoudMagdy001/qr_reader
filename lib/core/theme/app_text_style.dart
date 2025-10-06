import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App text styles with responsive sizing
class AppTextStyles {
  TextStyle get headlineLarge =>
      GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 32);

  TextStyle get headlineMedium =>
      GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 28);

  TextStyle get headlineSmall =>
      GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 24);

  TextStyle get titleLarge =>
      GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 22);

  TextStyle get titleMedium =>
      GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16);

  TextStyle get titleSmall =>
      GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14);

  TextStyle get bodyLarge =>
      GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.normal);

  TextStyle get bodyMedium =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.normal);

  TextStyle get bodySmall =>
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.normal);

  TextStyle get labelLarge =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500);

  TextStyle get labelMedium =>
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);
}
