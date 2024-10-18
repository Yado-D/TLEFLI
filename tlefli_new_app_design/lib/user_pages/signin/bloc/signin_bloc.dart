import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
  }
  FutureOr<void> emailEvent(
    EmailEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(email: event.email));
    print(state.email);
    print(state.password);
  }

  FutureOr<void> passwordEvent(
    PasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(password: event.password));
    print(state.email);
    print(state.password);
  }
}
