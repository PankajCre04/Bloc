part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

final class AuthLoginButtonPresses extends AuthEvent {
  final String email;
  final String password;
  AuthLoginButtonPresses({required this.email, required this.password});
}
