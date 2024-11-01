import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
// import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert' as convert;

class ApiService {
  final String baseUrl = 'https://hammerhead-app-ksgtg.ondigitalocean.app';

  Future<String> checkStatus() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/status'),
      );

      if (response.statusCode == 200) {
        print('status is 200 on status check');
        return json.decode(response.body)['status'];
      } else {
        throw Exception('Failed to load status');
      }
    } on Exception catch (e) {
      print('Error: $e');
      return e.toString();
    }
  }

  Future<String?> register(
    String firstName,
    String lastName,
    Uint8List profilePhoto,
    String email,
    String password,
    String phone,
  ) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/api/register'));
      request.fields['firstName'] = firstName;
      request.fields['lastName'] = lastName;
      request.fields['email'] = email;
      request.fields['password'] = password;
      request.fields['phone'] = phone;
      request.files
          .add(http.MultipartFile.fromBytes('profilePhoto', profilePhoto));

      var response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');

      if (response.statusCode == 201) {
        final loginResponse = await http.post(
          Uri.parse('$baseUrl/api/login'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'email': email, 'password': password}),
        );

        if (loginResponse.statusCode == 200) {
          Map<String, dynamic> token = json.decode(loginResponse.body);
          final userResponse = await GetUserProfileDetail(token['accessToken']);

          if (userResponse.isNotEmpty) {
            UserData userInfo = UserData(
              userFname: userResponse['profile']['firstName'],
              userLname: userResponse['profile']['lastName'],
              userEmail: userResponse['profile']['email'],
              userPhone: userResponse['profile']['phone'],
              userPassword: userResponse['profile']['_id'],
              userImage: userResponse['profile']['profilePhoto'],
              token: token,
            );

            await Global.storageServices
                .setData(AppConstants.USER_DATA, userInfo);
            return 'User verified';
          } else {
            return 'Failed to load user profile. Please try again.';
          }
        } else {
          return 'Login failed. Please check your credentials and try again.';
        }
      } else {
        return 'Registration failed. Please ensure all fields are correctly filled out and try again.';
      }
    } on TimeoutException catch (_) {
      return 'Request timed out. Please check your internet connection and try again.';
    } catch (e) {
      print('Error: $e');
      return 'An error occurred: ${e.toString()}. Please try again.';
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      print('Login attempt with email: $email');
      final response = await http
          .post(
        Uri.parse('$baseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      )
          .timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException('Connection timeout');
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> token = json.decode(response.body);
        print('Token received: $token');

        final userResponse = await http.get(
          Uri.parse('$baseUrl/api/user/profile'),
          headers: {
            'Authorization': 'Bearer ${token['accessToken']}',
            'Content-Type': 'application/json',
          },
        );

        if (userResponse.statusCode == 200) {
          final userData = jsonDecode(userResponse.body);
          if (userData.containsKey('profile')) {
            UserData userInfo = UserData(
              userFname: userData['profile']['firstName'],
              userLname: userData['profile']['lastName'],
              userEmail: userData['profile']['email'],
              userPhone: userData['profile']['phone'],
              userPassword: userData['profile']['_id'],
              userImage: userData['profile']['profilePhoto'],
              token: token,
            );
            await Global.storageServices
                .setData(AppConstants.USER_DATA, userInfo);
            return 'User verified';
          } else {
            return 'Unexpected response structure.';
          }
        } else if (userResponse.statusCode == 401) {
          return 'Unauthorized: Invalid credentials!';
        } else {
          return 'please,Login as an admin: ${userResponse.statusCode}';
        }
      } else if (response.statusCode == 401) {
        return 'Login failed: Invalid email or password.';
      } else {
        return 'Login failed: try again';
      }
    } on TimeoutException catch (_) {
      return 'Request timed out. Please try again.';
    } catch (e) {
      print('Error: $e');
      return 'An error occurred: ${e.toString()}';
    }
  }

//get user profile for most of the request

  Future<Map<String, dynamic>> GetUserProfileDetail(String token) async {
    try {
      final userResponse = await http.get(
        Uri.parse('$baseUrl/api/user/profile'),
        headers: {
          'Authorization': 'Bearer ${token}',
          'Content-Type': 'application/json',
        },
      );

      print(userResponse.body);

      if (userResponse.statusCode == 200) {
        final userJson = json.decode(userResponse.body);
        return userJson;
      } else {
        return {'message': 'unAuthorized'};
      }
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  // for posting lost or found items

  Future<String> PostLostOrFoundItems(
      itemPickedModel item_model, UserData userData) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('$baseUrl/api/user/item'));

      request.headers.addAll({
        'Authorization': 'Bearer ${userData.token['accessToken']}',
      });

      request.fields['itemName'] = item_model.nested_item ?? '';
      request.fields['category'] = item_model.main_catagory ?? '';
      request.fields['subcategory'] = item_model.nested_item ?? '';
      request.fields['location'] =
          '${item_model.address ?? ''} ${item_model.city ?? ''}';
      request.fields['date'] = item_model.date_picked ?? '';
      request.fields['description'] = item_model.item_description ?? '';
      request.fields['type'] = item_model.lostOrFound ?? '';

      if (item_model.pickedImage != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'itemImage',
          item_model.pickedImage!,
          filename: 'profile.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');

      if (response.statusCode == 201) {
        return 'Item successfully posted!';
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        final newAccessToken =
            await refreshAccessToken(userData.token['refreshToken']);
        userData.token['accessToken'] = newAccessToken;
        await Global.storageServices.setData(AppConstants.USER_DATA, userData);
        return await PostLostOrFoundItems(item_model, userData);
      } else {
        return 'Error posting item: ${response.statusCode}. Please try again.';
      }
    } on TimeoutException catch (_) {
      return 'Request timed out. Please check your internet connection and try again.';
    } catch (e) {
      print('Error: $e');
      return 'An error occurred: ${e.toString()}. Please try again.';
    }
  }

  // GetLostOrFoundItemsForUser

  Future<Map<String, dynamic>> GetLostOrFoundItemsForUser(
      UserData userData, String refreshToken) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/user/items'),
        headers: {
          'Authorization': 'Bearer ${userData.token['accessToken']}',
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException('Connection timeout');
      });

      if (response.statusCode == 200) {
        print('Access granted');
        var res = jsonDecode(response.body);
        return res;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        print('Status code: ${response.statusCode}');
        if (refreshToken.isEmpty) {
          return {'Error': 'Unauthorized. Please login again.'};
        }
        final newAccessToken = await refreshAccessToken(refreshToken);
        if (newAccessToken == null) {
          return {'Error': 'Failed to refresh token. Please login again.'};
        }
        userData.token['accessToken'] = newAccessToken;
        await Global.storageServices.setData(AppConstants.USER_DATA, userData);
        return await GetLostOrFoundItemsForUser(userData, newAccessToken);
      } else {
        return {'Error': 'Error: ${response.body}. Please try again.'};
      }
    } on TimeoutException catch (_) {
      return {
        'Error':
            'Request timed out. Please check your internet connection and try again.'
      };
    } catch (e) {
      print('Error: $e');
      return {'Error': 'An error occurred: ${e.toString()}. Please try again.'};
    }
  }

//refresh access token

  Future<String?> refreshAccessToken(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/refresh'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'token': refreshToken,
      }),
    );

    if (response.statusCode == 200) {
      print("refreshed");
      final data = jsonDecode(response.body);
      return data['accessToken'];
    } else {
      return null;
    }
  }

//updating user profile

  Future<String> updatingUserRequest(
      String refreshToken, UserData userData) async {
    try {
      var request =
          http.MultipartRequest('PUT', Uri.parse('$baseUrl/api/user/profile'));
      request.headers.addAll({
        'Authorization': 'Bearer ${userData.token['accessToken']}',
      });

      request.fields['firstName'] = userData.userFname;
      request.fields['lastName'] = userData.userLname;
      request.fields['phone'] = userData.userPhone;

      if (userData.userImage != null) {
        request.files.add(http.MultipartFile.fromBytes(
          'profilePhoto',
          userData.userImage is Uint8List
              ? userData.userImage
              : await urlToUint8List(userData.userImage),
          filename: 'profile.jpg',
          contentType: MediaType('image', 'jpeg'),
        ));
      }

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      print('Response body: $responseBody');

      if (response.statusCode == 200) {
        final userResponse = await http.get(
          Uri.parse('$baseUrl/api/user/profile'),
          headers: {
            'Authorization': 'Bearer ${userData.token['accessToken']}',
            'Content-Type': 'application/json',
          },
        );

        if (userResponse.statusCode == 200) {
          final userData2 = jsonDecode(userResponse.body);
          UserData userInfo = UserData(
            userFname: userData2['profile']['firstName'],
            userLname: userData2['profile']['lastName'],
            userEmail: userData2['profile']['email'],
            userPhone: userData2['profile']['phone'],
            userPassword: userData2['profile']['_id'],
            userImage: userData2['profile']['profilePhoto'],
            token: userData.token,
          );

          Global.storageServices.setData(AppConstants.USER_DATA, userInfo);
          return 'Perfect';
        } else {
          return 'Failed to load user profile: ${userResponse.statusCode}';
        }
      } else if (response.statusCode == 403) {
        final newAccessToken =
            await refreshAccessToken(userData.token['refreshToken']);
        userData.token['accessToken'] = newAccessToken;
        Global.storageServices.setData(AppConstants.USER_DATA, userData);
        return await updatingUserRequest(refreshToken, userData);
      } else {
        return 'Error: when Modifying data';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  Future<String> UpdateUserPostedItemsById(
      itemPickedModel item_model, UserData userData, String itemId) async {
    var request = http.MultipartRequest(
        'PUT', Uri.parse('${baseUrl}/api/user/item/$itemId'));

    request.headers.addAll({
      'Authorization': 'Bearer ${userData.token['accessToken']}',
    });

    request.fields['itemName'] = item_model.nested_item ?? '';
    request.fields['dateLost'] = item_model.date_picked ?? '';
    request.fields['location'] =
        '${item_model.address ?? ''} ${item_model.city ?? ''}';
    request.fields['category'] = item_model.main_catagory ?? '';
    request.fields['subcategory'] = item_model.nested_item ?? '';
    request.fields['color'] = item_model.item_color ?? '';
    request.files.add(await http.MultipartFile.fromBytes(
      'itemImage',
      item_model.pickedImage is Uint8List
          ? item_model.pickedImage
          : await urlToUint8List(item_model.pickedImage),
      filename: 'item.jpg',
      contentType: MediaType('image', 'jpeg'),
    ));

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return '${response.statusCode}';
    } else {
      return 'Failed to update item. Status code: ${response.statusCode}';
    }
  }

//for converting url to uint8List

  Future<Uint8List> urlToUint8List(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

//Deleeting a given user item

  Future<String> DeleteUserPostedItemsById(
      itemPickedModel item_model, UserData userData, String itemId) async {
    var request = http.MultipartRequest(
        'DELETE', Uri.parse('${baseUrl}/api/user/item/$itemId'));

    request.headers.addAll({
      'Authorization': 'Bearer ${userData.token['accessToken']}',
    });

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
    print(responseBody);
    if (response.statusCode == 200) {
      return '${response.statusCode}';
    } else {
      return 'Failed to Delete item. Status code: ${response.statusCode}';
    }
  }

  //gets a list of all items reported as lost by all users

  Future<String> GetAllUserLostItem() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/lost-items'),
      );
      if (response.statusCode == 200) {
        final lostItems = json.decode(response.body);
        return lostItems; // Convert the decoded JSON to a string
      }
      return "Some error occurred, please try again later";
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  //gets a list of all items reported as found by all users

  Future<Map<String, dynamic>> GetAllUserFoundItem() async {
    try {
      final Foundresponse = await http.post(
        Uri.parse('$baseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': 'yared4@gmail.com',
          'password': '12345',
        }),
      );
      Map<String, dynamic> tokenString = json.decode(Foundresponse.body);
      print(tokenString);
      String token = tokenString['accessToken'];

      final response = await http.get(
          Uri.parse(
            '$baseUrl/api/admin/items',
          ),
          headers: {
            'Authorization': 'Bearer $token',
          });

      print(response.body);
      if (response.statusCode == 200) {
        final FoundItems = json.decode(response.body);
        return FoundItems; // Convert the decoded JSON to a string
      }
      return {"message": "Some error occurred, please try again later"};
    } catch (e) {
      return {"message": 'Error: ${e.toString()}'};
    }
  }

//Admin homepage

  Future<String> AdminHomePage(String email, String password) async {
    try {
      final loginResponse = await http.post(
        Uri.parse('$baseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (loginResponse.statusCode == 200) {
        Map<String, dynamic> token = json.decode(loginResponse.body);
        print('Login Response Token: $token');

        final response = await http.get(
          Uri.parse('$baseUrl/api/admin'),
          headers: {
            'Authorization': 'Bearer ${token['accessToken']}',
          },
        );
        print('Admin Response Body: ${response.body}');

        if (response.statusCode == 200) {
          // get admin profile and assign to user data
          // Map<String, dynamic> userMap =
          //     await GetUserProfileDetail(token['accessToken']);

          // print(userMap);
          UserData? userData = UserData(
              userFname: 'Admin',
              userLname: 'access',
              userEmail: 'admin@gmail.com',
              userPhone: 'unknown',
              userImage: 'unknown',
              userPassword: '_id',
              token: token);

          await Global.storageServices
              .setData(AppConstants.USER_DATA, userData);
          return 'Authenticated';
        } else {
          return 'NotAuthenticated: ${response.statusCode}';
        }
      } else {
        return 'Can\'t login: ${loginResponse.statusCode}';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  //lists all user

  Future<Map<String, dynamic>> AdminGetAllUsers(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/users'),
        headers: {
          'Authorization': "Bearer ${token}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        final allUsers = json.decode(response.body);
        return allUsers;
      } else {
        return {'message': 'unAuthorized'};
      }

      // return "Some error occurred, please try again later";
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  //gives a user details

  Future<Map<String, dynamic>> AdminGetUsersDetails(
      String token, String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/user/$id'),
        headers: {
          'Authorization': "Bearer ${token}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        final allUsers = json.decode(response.body);
        return allUsers;
      } else {
        return {'message': 'unAuthorized'};
      }

      // return "Some error occurred, please try again later";
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  //delete specific user

  Future<String> AdminDeleteUser(String token, String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/admin/user/$id'),
        headers: {
          'Authorization': "Bearer ${token}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // final allUsers = json.decode(response.body);
        return 'User Deleted!';
      } else {
        return 'unAuthorized';
      }

      // return "Some error occurred, please try again later";
    } catch (e) {
      return e.toString();
    }
  }

  //promote a given user to admin status

  Future<String> AdminPromoteUser(String token, String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/user/$id/toAdmin'),
        headers: {
          'Authorization': "Bearer ${token}",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return 'Updated!';
      } else {
        print(response.body);
        return 'Error when updating';
      }

      // return "Some error occurred, please try again later";
    } catch (e) {
      return "message${e.toString()}";
    }
  }

// lists all reported items

  Future<Map<String, dynamic>> GetAllReportedItem(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/admin/items'),
        headers: {
          'Authorization': "Bearer ${token}",
        },
      );
      if (response.statusCode == 200) {
        final lostItems = json.decode(response.body);
        return lostItems; // Convert the decoded JSON to a string
      }
      return {'message': 'unAuthorized'};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

  // delete specific reported items

  Future<Map<String, dynamic>> GetAllReportedItemById(
      String token, String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/admin/item/$id'),
        headers: {
          'Authorization': "Bearer ${token}",
        },
      );
      if (response.statusCode == 200) {
        final lostItems = json.decode(response.body);
        return lostItems; // Convert the decoded JSON to a string
      }
      return {'message': 'unAuthorized'};
    } catch (e) {
      return {"message": e.toString()};
    }
  }

// payment methodes
  String domain = "https//api.sandbox.paypal.com";

  Future<String> GetAccessToken(String clientId, String secretId) async {
    try {
      // Map<String, dynamic> body = {"amount": 10000, "currency": "USD"};
      var client = BasicAuthClient(clientId, secretId);

      var response = await client.post(
          Uri.parse('$domain/v1/oauth2/token?grant_type=client_credentials'));

      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        return body["access_token"];
      }
      return "0";
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createPaypalPayment(
      transactions, accessToken) async {
    try {
      var response =
          await http.post(Uri.parse("$domain/v1/payments/payment"), headers: {
        "Authorization": "Bearer $accessToken",
        "content-type": "application/json",
      });
      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (body['links'] != null && body['links'].length > 0) {
          List links = body['links'];
          String excuteUrl = "";
          String approvalUrl = "";

          final item = links.firstWhere((o) => o['rel'] == "approval.url",
              orElse: () => null);
          if (item != null) {
            approvalUrl = item['hreff'];
          }
          final item1 = links.firstWhere((o) => o['rel'] == "execute",
              orElse: () => null);
          if (item != null) {
            excuteUrl = item1['hreff'];
          }
          return {
            "executeUrl": excuteUrl,
            "approvalUrl": approvalUrl,
          };
        }
        throw Exception("0");
      } else {
        throw Exception(body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> executePayment(url, payerId, accessToken) async {
    try {
      var response = await http.post(url,
          body: convert.jsonEncode({
            "payerId": payerId,
          }),
          headers: {
            "Authorization": "Bearer $accessToken",
            "content-type": "application/json"
          });
      final body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        return body['id'];
      }
      return "0";
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getUserMatch(UserData userData) async {
    try {
      final response = await http.get(
          Uri.parse(
            '$baseUrl/api/user/item/${userData.token['accessToken']}/matches',
          ),
          headers: {
            "Authorization": "Bearer ${userData.token['accessToken']}",
            "content-type": "application/json"
          });

      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
