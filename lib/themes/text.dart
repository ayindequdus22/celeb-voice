import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  const AppTextTheme._();

  static TextTheme buildTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Headlines → Poppins
      headlineLarge: GoogleFonts.poppins(
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),

      // Titles → Montserrat
      titleLarge: GoogleFonts.montserrat(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),

      // Body → Open Sans
      bodyLarge: GoogleFonts.openSans(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      bodyMedium: GoogleFonts.openSans(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface,
      ),
      bodySmall: GoogleFonts.openSans(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: colorScheme.onSurface.withValues(alpha: 0.8),
      ),

      // Buttons → Nunito Sans
      labelLarge: GoogleFonts.nunitoSans(
        fontSize: 16.sp, // 🔥 bumped for stronger CTA
        fontWeight: FontWeight.w700,
        // color: colorScheme.onPrimary,
      ),

      // Links → Inter
      labelMedium: GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.blue,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
