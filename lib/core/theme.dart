import 'package:flutter/material.dart';
import 'package:movie_app/core/colors.dart';
import 'package:movie_app/core/constants.dart';

// App Bar Theme
const appBarTheme = AppBarTheme(
  backgroundColor: kBlackColor,
  elevation: 0,
);

// Input Decorartion Theme
final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: UnderlineInputBorder(borderRadius: kBorderRadius8),
  focusedBorder: _border,
  errorBorder: _border,
  focusedErrorBorder: _border,
  errorStyle: const TextStyle(color: kAmberColor),
  filled: true,
  fillColor: kDarkGreyColor,
  floatingLabelAlignment: FloatingLabelAlignment.start,
  labelStyle: const TextStyle(color: kLightGreyColor),
  floatingLabelStyle: const TextStyle(color: kLightGreyColor),
);

final _border = UnderlineInputBorder(
  borderSide: const BorderSide(color: kAmberColor),
  borderRadius: kBorderRadius8,
);

// Text Theme
const textTheme = TextTheme(
  bodyLarge: TextStyle(color: Colors.white),
  bodyMedium: TextStyle(color: Colors.white),
  bodySmall: TextStyle(color: Colors.white),
);
