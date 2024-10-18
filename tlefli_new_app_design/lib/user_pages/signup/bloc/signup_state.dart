part of 'signup_bloc.dart';

class SignupState {
  final bool reciveInfo;
  final bool acceptPrivacy;
  final String fName;
  final String lName;
  final String email;
  final String password;
  final String passwordComfirmation;
  final String phoneNumber;
  SignupState({
    this.acceptPrivacy = false,
    this.reciveInfo = false,
    this.fName = "",
    this.lName = "",
    this.email = "",
    this.password = "",
    this.passwordComfirmation = '0900000000',
    this.phoneNumber = '0900000000',
  });
  SignupState copyWith({
    bool? acceptPrivacy,
    bool? reciveInfo,
    String? fName,
    String? lName,
    String? email,
    String? password,
    String? passwordComfirmation,
    String? phoneNumber,
  }) {
    return SignupState(
      acceptPrivacy: acceptPrivacy ?? this.acceptPrivacy,
      reciveInfo: reciveInfo ?? this.reciveInfo,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordComfirmation: passwordComfirmation ?? this.passwordComfirmation,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
