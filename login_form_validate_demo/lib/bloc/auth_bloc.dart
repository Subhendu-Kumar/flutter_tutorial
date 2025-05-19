import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
final passwordRegex = RegExp(
  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
);

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLogoutRequested(event, emit) async {
    try {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2), () {
        emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure("An error occurred! Please try again later."));
      return;
    }
  }

  void _onAuthLoginRequested(event, emit) async {
    final email = event.email.trim();
    final password = event.password;

    try {
      emit(AuthLoading());
      if (email.isEmpty || password.isEmpty) {
        emit(AuthFailure("Email or password is empty! Please fill it in."));
        return;
      }
      if (!emailRegex.hasMatch(email)) {
        emit(AuthFailure("Email is not valid! Please enter a valid email."));
        return;
      }
      if (!passwordRegex.hasMatch(password)) {
        emit(
          AuthFailure(
            "Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character (!@#\$&*~).",
          ),
        );
        return;
      }
      await Future.delayed(const Duration(seconds: 2), () {
        emit(AuthSuccess("${email.hashCode}"));
      });
    } catch (e) {
      emit(AuthFailure("An error occurred! Please try again later."));
      return;
    }
  }
}
