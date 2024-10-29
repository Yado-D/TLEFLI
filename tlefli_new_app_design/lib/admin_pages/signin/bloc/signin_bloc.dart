import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class AdminSigninBloc extends Bloc<SigninEvent, AdminSigninState> {
  AdminSigninBloc() : super(AdminSigninState()) {
    on<AdminEmailEvent>(emailEvent);
    on<AdminPasswordEvent>(passwordEvent);
  }
  FutureOr<void> emailEvent(
    AdminEmailEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(email: event.email));
    print(state.email);
    print(state.password);
  }

  FutureOr<void> passwordEvent(
    AdminPasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(password: event.password));
    print(state.email);
    print(state.password);
  }
}
