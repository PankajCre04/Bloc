import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginButtonPresses>(_onAuthLoginButtonPressed);
  }

  void _onAuthLoginButtonPressed(
      AuthLoginButtonPresses event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      if (event.email.isEmpty || event.password.length < 6) {
        return emit(AuthFailure("Uid not fetched"));
      }
      await Future.delayed(const Duration(seconds: 4), () {
        return emit(AuthSuccess("Uid : 99737"));
      });
    } catch (error) {
      return emit(AuthFailure("Uid not fetched"));
    }
  }
}
