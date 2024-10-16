import 'package:flutter/material.dart';

class SignupAuth {
  static Future<String> SignupAuthentication({
    required BuildContext context,
    required String fName,
    required String lName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool reciveInfo,
    required bool acceptPrivacy,
  }) async {
    if (fName.isEmpty) {
      return 'first name is required';
    } else if (lName.isEmpty) {
      return 'last name is required';
    } else if (email.isEmpty) {
      return 'email is required';
    } else if (password.isEmpty) {
      return 'password is required';
    } else if (confirmPassword.isEmpty) {
      return 'password is not the same.';
    } else if (reciveInfo == false) {
      return 'accept the terms';
    } else if (acceptPrivacy == false) {
      return 'accept privacy';
    }

    // add the data to database
    return 'welcome my friend';
  }
}
