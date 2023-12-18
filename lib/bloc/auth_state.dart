part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final String msg;
  AuthSuccess(this.msg);
}

class AuthFailure extends AuthState {
  final String msg;
  AuthFailure(this.msg);
}

class AuthLoading extends AuthState {}
