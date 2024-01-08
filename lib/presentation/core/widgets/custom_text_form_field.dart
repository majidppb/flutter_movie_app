import 'package:flutter/material.dart';
import 'package:movie_app/application/login/login_bloc.dart';
import 'package:movie_app/presentation/core/colors.dart';

// Custom Text Form Field
class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;

  const CustomTextFormFieldWidget({
    super.key,
    required TextEditingController controller,
    required String label,
    LoginState? state,
  })  : _label = label,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: const TextStyle(color: kWhiteColor),
      decoration: InputDecoration(
        labelText: _label,
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Please Enter $_label';
        } else {
          return null;
        }
      },
    );
  }
}

// Custom Password Field
class CustomPasswodFieldWidget extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final ValueNotifier<bool> _isPaswdHidden = ValueNotifier(false);

  CustomPasswodFieldWidget({
    super.key,
    required TextEditingController controller,
    required String label,
  })  : _label = label,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isPaswdHidden,
      builder: (_, isPaswdHidden, __) {
        return TextFormField(
          controller: _controller,
          obscureText: isPaswdHidden,
          style: const TextStyle(color: kWhiteColor),
          decoration: InputDecoration(
            labelText: _label,
            suffixIcon: TextButton(
                onPressed: () {
                  _isPaswdHidden.value = !isPaswdHidden;
                },
                child: Text(
                  isPaswdHidden ? 'SHOW' : 'HIDE',
                  style: const TextStyle(
                    color: kLightGreyColor,
                  ),
                )),
          ),
          validator: (password) {
            if (password == null || password.isEmpty) {
              return 'Please Enter $_label';
            } else {
              return null;
            }
          },
        );
      },
    );
  }
}
