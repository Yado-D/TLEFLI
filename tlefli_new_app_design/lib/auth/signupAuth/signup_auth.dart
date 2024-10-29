import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/auth/API/defoultImage.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';

class SignupAuth {
  static Future<String> SignupAuthentication({
    required BuildContext context,
    required String fName,
    required String lName,
    required String email,
    required String password,
    required String confirmPassword,
    Uint8List? photo,
    required bool reciveInfo,
    required bool acceptPrivacy,
    required String phone,
  }) async {
    if (fName.isEmpty) {
      return 'first name is required';
    } else if (lName.isEmpty) {
      return 'last name is required';
    } else if (email.isEmpty) {
      return 'email is required';
    } else if (password.isEmpty) {
      return 'password is required';
    } else if (password != confirmPassword) {
      return 'both password should be similar';
    } else if (reciveInfo == false) {
      return 'accept the terms';
    } else if (acceptPrivacy == false) {
      return 'accept privacy';
    }

    // add the data to database
    photo = await loadAsset('assets/images/background.jpeg');

    String? loginVerification = await ApiService().register(
      fName,
      lName,
      photo,
      email,
      password,
      phone,
    );

    if (loginVerification != 'User verified') {
      return loginVerification!;
    } else {
      Global.storageServices
          .setBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST, true);
      return 'user_verified';
    }
  }
}
