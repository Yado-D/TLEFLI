import 'package:flutter/material.dart';

class SigninAuth {
  static Future<String> SigninAuthentication({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isEmpty) {
      return 'email is required';
    } else if (password.isEmpty) {
      return 'password is required';
    }

    // add the data to database
    return 'welcome back my friend';
  }
}
