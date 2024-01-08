import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/colors.dart';

class GreyOutlinedButtonWidget extends StatelessWidget {
  final String _label;
  final Icon _icon;
  final void Function() _onPressed;
  const GreyOutlinedButtonWidget(
      {super.key,
      required String label,
      required Icon icon,
      required void Function() onPressed})
      : _label = label,
        _icon = icon,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: _onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: kLightGreyColor,
          side: const BorderSide(color: kLightGreyColor),
          elevation: 0,
        ),
        icon: _icon,
        label: Text(_label));
  }
}
