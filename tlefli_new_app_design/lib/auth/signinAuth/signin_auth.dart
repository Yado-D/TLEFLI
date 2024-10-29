import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:http/http.dart' as http;

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

    // read the data to database or verification

    String? loginVerification = await ApiService().login(email, password);
    print(loginVerification);
    if (loginVerification != 'User verified') {
      return loginVerification!;
    } else {
      Global.storageServices
          .setBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST, true);

      return 'user_verified';
    }
  }

  // static Future<UserData> UpdateUserInformation({
  //   required BuildContext context,
  //   required UserData userData,
  // }) async {
  //   final String baseUrl = 'https://hammerhead-app-ksgtg.ondigitalocean.app';

  //   try {
  //     final response = await http.put(
  //       Uri.parse('$baseUrl/api/register'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({
  //         'firstName': userData.userFname,
  //         'lastName': userData.userLname,
  //         'profilePhoto': userData.userImage,
  //         'email': userData.userEmail,
  //         'password': userData.password,
  //         "phone": userData.userPhone,
  //       }),
  //     );

  //     if (response.statusCode == 201) {
  //       Global.storageServices.setData(AppConstants.USER_DATA, userInfo);
  //       return 'user_verified';
  //     } else {
  //       return 'Registration failed';
  //     }
  //   } catch (e) {
  //     return userData;
  //   }
  // }
}
