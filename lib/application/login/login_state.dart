part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {required bool isInvalid, required bool isLoggedIn}) = _LoginState;

  factory LoginState.initial() =>
      const LoginState(isInvalid: false, isLoggedIn: false);
}
