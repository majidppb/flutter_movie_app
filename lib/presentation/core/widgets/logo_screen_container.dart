import 'package:flutter/material.dart';

class LogoScreenContainer extends StatelessWidget {
  final Widget _child;
  const LogoScreenContainer({super.key, required Widget child})
      : _child = child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/banner.png',
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: _child,
          )
        ],
      )),
    );
  }
}
