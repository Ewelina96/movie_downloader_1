import 'package:flutter/material.dart';
import 'package:movie_downloader_1/values/app_colors.dart';
import 'package:movie_downloader_1/values/dimensions.dart';

ThemeData lightTheme() => ThemeData(
      primaryColor: AppColors.primary,
      cardColor: AppColors.white,
      backgroundColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.almostWhite,
      hintColor: AppColors.lightGrey,
      textTheme: _textTheme(isDark: false),
    );

ThemeData darkTheme() => ThemeData(
      primaryColor: AppColors.primary,
      cardColor: AppColors.darkGrey,
      backgroundColor: AppColors.darkGrey,
      scaffoldBackgroundColor: AppColors.heavyDarkGrey,
      hintColor: AppColors.lightGrey,
      textTheme: _textTheme(isDark: true),
    );

TextTheme _textTheme({required bool isDark}) => TextTheme(
      headline6: _titleTextStyle(isDark: isDark),
      subtitle2: _subtitleTextStyle(isDark: isDark),
      bodyText2: _bodyText2Style(isDark: isDark),
      button: _buttonTextStyle(isDark: isDark),
      bodyText1: _bodyText1Style(isDark: isDark),
      caption: _captionTextStyle,
    );

TextStyle _titleTextStyle({required bool isDark}) => TextStyle(
      color: isDark ? AppColors.white : AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: Dimensions.TITLE_TEXT_SIZE,
    );

TextStyle _subtitleTextStyle({required bool isDark}) => TextStyle(
      color: isDark ? AppColors.white : AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: Dimensions.SUBTITLE_TEXT_SIZE,
    );

TextStyle _bodyText2Style({required bool isDark}) => TextStyle(
      color: isDark ? AppColors.white : AppColors.black,
      fontSize: Dimensions.BODY_TEXT_SIZE,
    );

const _captionTextStyle = TextStyle(
  color: AppColors.lightGrey,
  fontSize: Dimensions.SMALL_TEXT_SIZE,
);

TextStyle _buttonTextStyle({required bool isDark}) => TextStyle(
      color: isDark ? AppColors.white : AppColors.black,
      fontWeight: FontWeight.w600,
      fontSize: Dimensions.BODY_TEXT_SIZE,
    );

TextStyle _bodyText1Style({required bool isDark}) => TextStyle(
      color: isDark ? AppColors.white : AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.BODY_BIG_TEXT_SIZE,
    );

extension ThemeGetter on BuildContext {
  TextStyle? titleStyle() => Theme.of(this).textTheme.headline6;

  TextStyle? subtitleTextStyle() => Theme.of(this).textTheme.subtitle2;

  TextStyle? captionTextStyle() => Theme.of(this).textTheme.caption;

  TextStyle? bodyText1Style() => Theme.of(this).textTheme.bodyText1;

  TextStyle? bodyText2Style() => Theme.of(this).textTheme.bodyText2;

  Color primaryColor() => Theme.of(this).primaryColor;

  Color backgroundColor() => Theme.of(this).backgroundColor;

  Color scaffoldBackgroundColor() => Theme.of(this).scaffoldBackgroundColor;

  Color errorColor() => Theme.of(this).errorColor;

  Color hintColor() => Theme.of(this).hintColor;

  Color? iconColor() => Theme.of(this).iconTheme.color;

  Color? textColor() => Theme.of(this).textTheme.bodyText1!.color;
}
