import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/infrastructure/core/shared_prefs.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SharedPrefs _prefs;
  LoginBloc(this._prefs) : super(LoginState.initial()) {
    on<_LoginPressed>((event, emit) {
      // Dummy password check
      // if username and password match
      if (event.email == event.password) {
        _prefs.setLoggedIn(true);
        emit(const LoginState(isInvalid: false, isLoggedIn: true));
        return;
      }
      // If username and password does not match
      emit(const LoginState(isInvalid: true, isLoggedIn: false));
    });
  }
}
