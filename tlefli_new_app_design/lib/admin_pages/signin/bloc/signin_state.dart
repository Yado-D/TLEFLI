part of 'signin_bloc.dart';

class AdminSigninState {
  final String email;
  final String password;
  AdminSigninState({
    this.email = "",
    this.password = "",
  });
  AdminSigninState copyWith({
    String? email,
    String? password,
  }) {
    return AdminSigninState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
