import 'package:celeb_voice/themes/color_scheme.dart';
import 'package:celeb_voice/themes/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  const AppTheme();
  static ThemeData _buildTheme(
    ColorScheme colorScheme,
    BuildContext context,
    TextTheme textTheme,
  ) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      tabBarTheme: TabBarThemeData(
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.symmetric(horizontal: 12.0.w),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(color: colorScheme.onPrimaryContainer),

        filled: true,
        errorStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: colorScheme.error,
        ),
        fillColor: colorScheme.primaryContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(color: colorScheme.onPrimaryContainer),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10).r,
          borderSide: BorderSide(color: colorScheme.primary, width: 2.w),
        ),
      ),
      dividerTheme: DividerThemeData(color: colorScheme.onPrimaryContainer),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50.h)),
          splashFactory: InkSparkle.splashFactory,
          textStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(colorScheme.primary),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(colorScheme.primary),
          textStyle: WidgetStatePropertyAll(
            Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  static ThemeData lightMode(BuildContext context) {
    return _buildTheme(
      MyColorScheme.lightColorScheme,
      context,
      AppTextTheme.buildTextTheme(MyColorScheme.lightColorScheme),
    );
  }

  static ThemeData darkMode(BuildContext context) {
    return _buildTheme(
      MyColorScheme.darkColorScheme,
      context,
      AppTextTheme.buildTextTheme(MyColorScheme.darkColorScheme),
    );
  }
}
