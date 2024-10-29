part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

class AdminEmailEvent extends SigninEvent {
  final String email;
  AdminEmailEvent(this.email);
}

class AdminPasswordEvent extends SigninEvent {
  final String password;
  AdminPasswordEvent(this.password);
}
