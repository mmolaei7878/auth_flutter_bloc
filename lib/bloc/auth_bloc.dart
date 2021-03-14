import 'dart:async';
import 'package:auth_flutter_bloc/Repository/AuthRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authrepository = AuthRepository();

  AuthBloc() : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is UnAuthEvent) {
      final tokenSaved = await _authrepository.tryAutoLogin();
      if (tokenSaved == null) {
        yield AuthInitialState();
      } else {
        yield AuthSuccedState(token: tokenSaved);
      }
    } else if (event is AuthLoginEvent) {
      yield AuthInProgressState();
      final res = await _authrepository.login(event.email, event.password);
      if (res == null) {
        yield AuthFailedState(error: 'faile to Auth');
      } else {
        yield AuthSuccedState(token: res);
      }
    } else if (event is AuthSignUpEvent) {
      yield AuthInProgressState();
      final res = await _authrepository.signUp(event.email, event.password);
      if (res == null) {
        yield AuthFailedState(error: 'faile to Auth');
      } else {
        yield AuthSuccedState(token: res);
      }
    } else if (event is AuthLogoutEvent) {
      await _authrepository.logOut();
      yield AuthLogoutState();
    }
  }
}
