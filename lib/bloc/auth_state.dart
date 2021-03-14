part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthInProgressState extends AuthState {}

class AuthLogoutState extends AuthState {}

class AuthSuccedState extends AuthState {
  final String token;
  AuthSuccedState({this.token});
}

class AuthFailedState extends AuthState {
  final String error;
  AuthFailedState({this.error});
}
