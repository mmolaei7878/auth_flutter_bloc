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
  bool get isValidPassword => password.length > 6;
  AuthSignUpEvent({this.email, this.password});
}

class AuthLogoutEvent extends AuthEvent {}
