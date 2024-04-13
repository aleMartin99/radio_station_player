import 'package:flutter/material.dart';
import 'package:radio_station_player/core/theme/colors_light.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Class that contains the themes of the app.
class AppThemes {
  /// Height of the app bar.
  static final double appBarHeight = 6.h;

  /// Little app bar height.
  static final double littleAppBarHeight = 3.h;

  /// Dialog background color.
  static final Color dialogBackgroundColor = Colors.black.withOpacity(0.50);

  /// Method that configure the text theme of the app.
  static TextTheme _createCustomTextTheme(TextTheme baseTextTheme) {
    return baseTextTheme.copyWith(
      displayLarge: baseTextTheme.displayLarge?.copyWith(fontSize: 22.sp),
      displayMedium: baseTextTheme.displayMedium?.copyWith(fontSize: 20.sp),
      displaySmall: baseTextTheme.displaySmall?.copyWith(fontSize: 16.sp),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(fontSize: 17.sp),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(fontSize: 15.sp),
      bodySmall: baseTextTheme.bodySmall?.copyWith(fontSize: 14.sp),
      titleMedium: baseTextTheme.bodySmall
          ?.copyWith(fontSize: 11.sp, color: LightColors.subtitleTextColor),
    );
  }

  /// Method that creates the light theme of the app.
  static ThemeData getLightTheme() {
    final customLightTheme = ThemeData(
      brightness: Brightness.light,
    );

    final customTextTheme = _createCustomTextTheme(customLightTheme.textTheme);

    return customLightTheme.copyWith(
      textTheme: customTextTheme,
      scaffoldBackgroundColor: LightColors.backgroundColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: LightColors.primaryColor,
        onPrimary: LightColors.onPrimaryColor,
        background: LightColors.backgroundColor,
        onBackground: LightColors.onBackgroundColor,
        shadow: LightColors.shadowColor,
        error: LightColors.errorColor,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: appBarHeight,
        backgroundColor: LightColors.backgroundColor,
        titleTextStyle: customTextTheme.displayLarge
            ?.copyWith(color: LightColors.primaryColor),
        elevation: 0,
      ),
    );
  }
}
