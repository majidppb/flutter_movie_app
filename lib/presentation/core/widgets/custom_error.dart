import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.error_rounded,
            color: kLightGreyColor,
          ),
          Text(
            'Sorry, something went wrong.',
            style: TextStyle(color: kLightGreyColor),
          )
        ],
      ),
    );
  }
}
