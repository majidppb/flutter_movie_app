import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/application/login/login_bloc.dart';
import 'package:movie_app/presentation/core/colors.dart';
import 'package:movie_app/presentation/core/styles.dart';
import 'package:movie_app/core/routes/router.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/presentation/core/widgets/custom_text_form_field.dart';
import 'package:movie_app/presentation/core/widgets/heading_widget.dart';
import 'package:movie_app/presentation/core/widgets/logo_screen_container.dart';

import '../../core/di/injectable.dart';

// Bloc Provider
class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<LoginBloc>(),
      child: _ScreenLogin(),
    );
  }
}

// Screen Login
class _ScreenLogin extends StatelessWidget {
  final _frmKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LogoScreenContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingWidget(
          title: 'Sign In',
          fontSize: 30,
        ),
        kHeight55,
        Form(
          key: _frmKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<LoginBloc, LoginState>(
                listener: _gotoWhosWatching,
                builder: (context, state) {
                  // Invalid password or username message
                  return Visibility(
                    visible: state.isInvalid,
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      padding: kPadding10,
                      decoration: BoxDecoration(
                          color: kAmberColor, borderRadius: kBorderRadius8),
                      child: const Text('Invalid Email and Password'),
                    ),
                  );
                },
              ),
              kHeight,
              CustomTextFormFieldWidget(controller: _email, label: 'Email'),
              kHeight,
              CustomPasswodFieldWidget(
                controller: _passWord,
                label: 'Password',
              ),
            ],
          ),
        ),
        kHeight55,

        // Sign in Button
        MaterialButton(
          textColor: kWhiteColor,
          color: kRedColor,
          minWidth: double.infinity,
          height: 60,
          elevation: 0,
          padding: kPadding10,
          shape: kMButtonBorder,
          onPressed: () => _validate(context),
          child: const Text(
            'Sign In',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ));
  }

  void _gotoWhosWatching(BuildContext _, LoginState state) {
    if (state.isLoggedIn) {
      router.pushReplacement(Routes.whoIsWatchingPath);
    }
  }

  void _validate(BuildContext context) {
    if (_frmKey.currentState!.validate()) {
      final email = _email.text;
      final password = _passWord.text;
      BlocProvider.of<LoginBloc>(context).add(LoginEvent.loginPressed(
        email: email,
        password: password,
      ));
    }
  }
}
