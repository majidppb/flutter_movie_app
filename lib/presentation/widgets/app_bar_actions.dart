import 'package:flutter/material.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router.dart';
import 'package:movie_app/domain/core/my_app_router/my_app_router_constatnts.dart';

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
      MyAppRouter.router.push(MyAppRouterConstatnts.settingsPath);
    },
  ),
  kWidth,
];
