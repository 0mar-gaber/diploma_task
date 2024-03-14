import 'package:flutter/material.dart';

import 'colors/colors.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color.fromRGBO(0, 65, 130, 1.0),
          selectionColor: Color.fromRGBO(158, 158, 158, 1.0),
      ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,

      primary: AppColors.backGroundColorLight,
      secondary: AppColors.themIconLight,

      error: AppColors.logINCreateText1Light,
      errorContainer: AppColors.logINCreateText2Light,

      onPrimaryContainer: AppColors.logINCreateEditTextBackGroundColorLight,
      onSecondary:AppColors.logINCreateEditTextPrimaryTextLight ,
      inversePrimary: AppColors.logINCreateEditUpLabelTextLight,
      inverseSurface: AppColors.logINCreateEditInLabelTextLight,
      onBackground: AppColors.logINCreateEditInIconLight,

      onError: AppColors.logINCreateButtonColorLight,
      onErrorContainer: AppColors.logINCreateButtonTextLight,

      onInverseSurface: AppColors.logINCreateLastText1Light,




      onSecondaryContainer: AppColors.homeAppBarText1Light,
      onSurface: AppColors.homeAppBarText2Light,
      onSurfaceVariant: AppColors.homeSignOutIconLight,

      onTertiary: AppColors.homeText1FirstLight,
      onTertiaryContainer: AppColors.homeText1SecondLight,
      outline: AppColors.homeText2Light,

      outlineVariant: AppColors.homeCourseBackGroundColorLight,
      primaryContainer: AppColors.homeCourseTitle1Light,
      scrim: AppColors.homeCourseTitle2Light,
      secondaryContainer: AppColors.homeCourseButtonColorLight,
      surface: AppColors.homeCourseButtonTextLight,

    )
  );

  static ThemeData darkTheme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color.fromRGBO(0, 65, 130, 1.0),
          selectionColor: Color.fromRGBO(158, 158, 158, 1.0),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,

          primary: AppColors.backGroundColorDark,
          secondary: AppColors.themIconDark,

          error: AppColors.logINCreateText1Dark,
          errorContainer: AppColors.logINCreateText2Dark,

          onPrimaryContainer: AppColors.logINCreateEditTextBackGroundColorDark,
          onSecondary:AppColors.logINCreateEditTextPrimaryTextDark ,
          inversePrimary: AppColors.logINCreateEditUpLabelTextDark,
          inverseSurface: AppColors.logINCreateEditInLabelTextDark,
          onBackground: AppColors.logINCreateEditInIconDark,

          onError: AppColors.logINCreateButtonColorDark,
          onErrorContainer: AppColors.logINCreateButtonTextDark,

          onInverseSurface: AppColors.logINCreateLastText1Dark,




          onSecondaryContainer: AppColors.homeAppBarText1Dark,
          onSurface: AppColors.homeAppBarText2Dark,
          onSurfaceVariant: AppColors.homeSignOutIconDark,

          onTertiary: AppColors.homeText1FirstDark,
          onTertiaryContainer: AppColors.homeText1SecondDark,
          outline: AppColors.homeText2Dark,

          outlineVariant: AppColors.homeCourseBackGroundColorDark,
          primaryContainer: AppColors.homeCourseTitle1Dark,
          scrim: AppColors.homeCourseTitle2Dark,
          secondaryContainer: AppColors.homeCourseButtonColorDark,
          surface: AppColors.homeCourseButtonTextDark,

      )
  );

}