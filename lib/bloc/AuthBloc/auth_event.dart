part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class UnAuthEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLoginEvent({this.email, this.password});
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpEvent({
    @required this.email,
    @required this.password,
  });
}

class AuthLogoutEvent extends AuthEvent {}
