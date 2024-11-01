import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/admin_pages/get_all_user/page/getUserDetails.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class getAllUsers extends StatefulWidget {
  const getAllUsers({super.key});

  @override
  State<getAllUsers> createState() => _getAllUsersState();
}

class _getAllUsersState extends State<getAllUsers> {
  UserData? userData;
  Future<Map<String, dynamic>>? usersMap;
  @override
  void initState() {
    super.initState();
    userData = Global.storageServices.getData(AppConstants.USER_DATA);
    print('$userData++++++++++++++++');
    usersMap = ApiService().AdminGetAllUsers(userData!.token['accessToken']);
    print('$usersMap------------');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'All user'),
      body: ListView(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: const Color.fromARGB(255, 224, 224, 224)),
              ),
              child: reusableTextField(
                icon_name: "b_normal_search",
                hintText: 'Search user',
                textType: 'user',
                onchange: (onchange) {},
              ),
            ),
          ),
          ReusableText(
            FromTop: 20,
            FromLeft: 25,
            TextString: 'All user',
            FontSize: 20,
            TextColor: ColorCollections.Black,
          ),
          FutureBuilder(
            future: usersMap,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: ReusableText(
                    TextString: 'error',
                    FontSize: 20,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                print(snapshot.data!['count']);
                int count = snapshot.data!['count'];
                final snap = snapshot.data!['userList'];
                return ConstrainedBox(
                  constraints: BoxConstraints.fromViewConstraints(
                    ViewConstraints(
                        maxHeight: MediaQuery.of(context).size.height),
                  ),
                  child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (context, index) {
                      // final token =
                      //     ApiService().login(snap[index]['email'], password);
                      UserData userinfo = UserData(
                        userFname: snap[index]['firstName'],
                        userLname: snap[index]['lastName'],
                        userEmail: snap[index]['email'],
                        userPhone: snap[index]['phone'],
                        userImage: snap[index]['profilePhoto'],
                        userPassword: snap[index]['_id'],
                        token: userData!.token,
                      );
                      return userWidget(
                        userData1: userinfo,
                        ontap: () =>
                            userClickedPopUpWidget(userData2: userinfo),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: ReusableText(
                    TextString: snapshot.data.toString(),
                    FontSize: 20,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget userWidget({
    required VoidCallback ontap,
    required UserData? userData1,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(
                color: ColorCollections.SecondaryColor,
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(userData1!.userImage),
              ),
            ),
          ),
          ReusableText(
            FromLeft: 25,
            TextString: userData1.userFname + " " + userData1.userLname,
            FontSize: 20,
            TextColor: ColorCollections.Black,
          ),
        ],
      ),
    );
  }

  userClickedPopUpWidget({required UserData? userData2}) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GetUserDetails(
                      userData: userData2,
                    ),
                  ),
                );
              },
              child: ReusableText(
                FromTop: 10,
                FromLeft: 25,
                TextString: 'User details',
                FontSize: 20,
                TextColor: ColorCollections.Black,
              ),
            ),
            GestureDetector(
              onTap: () {
                AdminActionClickedPopUpWidget(
                  userData: userData,
                  text: 'change user to admin?',
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  onConfirm: () async {
                    print(userData2!.userPassword);
                    print(userData2.token['accessToken']);

                    //api call and pop up
                    String res = await ApiService().AdminPromoteUser(
                      userData2.token['accessToken'],
                      userData2.userPassword,
                    );
                    if (res == 'Updated!') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      commonSnackBar(context, 'User role updated to admin!');
                    } else {
                      commonSnackBar(
                          context, 'Error: check your internet connection');
                    }
                  },
                );
              },
              child: ReusableText(
                FromTop: 10,
                FromLeft: 25,
                TextString: 'Change to admin',
                FontSize: 20,
                TextColor: ColorCollections.Black,
              ),
            ),
            GestureDetector(
              onTap: () {
                AdminActionClickedPopUpWidget(
                  userData: userData,
                  text: 'delete this user?',
                  onCancel: () {
                    Navigator.pop(context);
                  },
                  onConfirm: () async {
                    //api call and pop up
                    String res = await ApiService().AdminDeleteUser(
                      userData2!.token['accessToken'],
                      userData2.userPassword,
                    );
                    if (res == 'User Deleted!') {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      commonSnackBar(context, 'User Deleted!');
                    } else {
                      commonSnackBar(
                          context, 'Error: check your internet connection');
                    }
                  },
                );
              },
              child: ReusableText(
                FromTop: 10,
                FromLeft: 25,
                TextString: 'Delete',
                FontSize: 20,
                TextColor: const Color.fromARGB(255, 216, 18, 18),
              ),
            ),
          ],
        );
      },
    );
  }

  AdminActionClickedPopUpWidget(
      {required String text,
      required VoidCallback onCancel,
      required VoidCallback onConfirm,
      required UserData? userData}) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            ReusableText(
              FromTop: 10,
              FromLeft: 25,
              TextString: 'Are  you sure you want to $text',
              FontSize: 20,
              TextColor: ColorCollections.Black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onConfirm,
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorCollections.SecondaryColor,
                      ),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Confirm',
                        FontSize: 20,
                        TextColor: ColorCollections.Black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ColorCollections.TeritiaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorCollections.SecondaryColor,
                      ),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Cancel',
                        FontSize: 20,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
