import 'package:flutter/material.dart';
import 'package:movie_app/presentation/core/colors.dart';

class VideoActionWidget extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final void Function()? _onPressed;
  const VideoActionWidget(
      {super.key,
      required IconData icon,
      required String title,
      void Function()? onPressed})
      : _icon = icon,
        _title = title,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          IconButton(
              onPressed: _onPressed,
              icon: Icon(
                _icon,
                color: kWhiteColor,
              )),
          Text(
            _title,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}

class VideoActionGreyWidget extends StatelessWidget {
  final IconData _icon;
  final String _title;
  final void Function()? _onPressed;
  const VideoActionGreyWidget(
      {super.key,
      required IconData icon,
      required String title,
      void Function()? onPressed})
      : _icon = icon,
        _title = title,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: _onPressed,
            icon: Icon(
              _icon,
              color: kWhiteColor,
              size: 33,
            )),
        Text(
          _title,
          style: const TextStyle(color: kGreyColor),
        ),
      ],
    );
  }
}
