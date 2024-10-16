part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class FNameEvent extends SignupEvent {
  final String fName;
  FNameEvent(this.fName);
}

class LNameEvent extends SignupEvent {
  final String lName;
  LNameEvent(this.lName);
}

class EmailEvent extends SignupEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SignupEvent {
  final String password;
  PasswordEvent(this.password);
}

class PasswordConfirmationEvent extends SignupEvent {
  final String confirmPassword;
  PasswordConfirmationEvent(this.confirmPassword);
}

class PhoneEvent extends SignupEvent {
  final String phoneNumber;
  PhoneEvent(this.phoneNumber);
}

class ReciveInfoEvent extends SignupEvent {
  final bool reciveInfo;
  ReciveInfoEvent(this.reciveInfo);
}

class AcceptPrivacyEvent extends SignupEvent {
  final bool acceptPrivacy;
  AcceptPrivacyEvent(this.acceptPrivacy);
}
