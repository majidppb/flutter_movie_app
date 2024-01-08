import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required String title, double fontSize = 22})
      : _title = title,
        _fontSize = fontSize;

  final String _title;
  final double _fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: _fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
