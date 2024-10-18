import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
    on<PasswordConfirmationEvent>(passwordConfirmationEvent);
    on<FNameEvent>(fNameEvent);
    on<LNameEvent>(lNameEvent);
    on<AcceptPrivacyEvent>(acceptPrivacyEvent);
    on<ReciveInfoEvent>(reciveInfoEvent);
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

  FutureOr<void> passwordConfirmationEvent(
    PasswordConfirmationEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(password: event.confirmPassword));
    print(state.email);
    print(state.password);
  }

  FutureOr<void> fNameEvent(
    FNameEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(fName: event.fName));
    print(state.fName);
    print(state.email);
    print(state.password);
  }

  FutureOr<void> lNameEvent(
    LNameEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(lName: event.lName));
    print(state.lName);
    print(state.email);
    print(state.password);
  }

  FutureOr<void> phoneEvent(
    PhoneEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
    print(state.phoneNumber);
    print(state.email);
    print(state.password);
  }

  FutureOr<void> acceptPrivacyEvent(
    AcceptPrivacyEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(acceptPrivacy: event.acceptPrivacy));
  }

  FutureOr<void> reciveInfoEvent(
    ReciveInfoEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(reciveInfo: event.reciveInfo));
  }
}
