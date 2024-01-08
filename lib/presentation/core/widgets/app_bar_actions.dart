import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/core/routes/router.dart';
import 'package:movie_app/core/routes/routes.dart';

final appBarActions = [
  const Icon(
    Icons.cast,
    color: Colors.white,
    size: 30,
  ),
  kWidth,
  IconButton(
    padding: EdgeInsets.zero,
    iconSize: 30,
    icon: Image.asset(
      'assets/profile.png',
    ),
    onPressed: () {
      router.push(Routes.settingsPath);
    },
  ),
  kWidth,
];
