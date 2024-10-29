import 'dart:convert';
import 'dart:typed_data';

class UserData {
  String userFname;
  String userLname;
  String userEmail;
  String userPhone;
  dynamic userImage;
  String userPassword;
  Map<String, dynamic> token;

  UserData({
    required this.userFname,
    required this.userLname,
    required this.userEmail,
    required this.userPhone,
    required this.userImage,
    required this.userPassword,
    required this.token,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'userFname': userFname,
      'userLname': userLname,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'userImage': userImage,
      'userPassword': userPassword,
      'token': token,
    };
  }

  // Create from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userFname: json['userFname'],
      userLname: json['userLname'],
      userEmail: json['userEmail'],
      userPhone: json['userPhone'],
      userImage: json['userImage'],
      userPassword: json['userPassword'] ?? '',
      token: json['token'] ?? "",
    );
  }
}
