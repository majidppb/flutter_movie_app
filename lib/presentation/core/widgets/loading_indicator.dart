import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/colors.dart';

// Indicator
class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

// Text Widget
class LoadingTextWidget extends StatelessWidget {
  const LoadingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Loading ..',
        style: TextStyle(color: kLightGreyColor),
      ),
    );
  }
}
