import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/pickImages.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  Uint8List? pickFile;
  UserData? userData;
  bool isFinished = true;
  // @override
  // void initState() {
  //   super.initState();
  // }
  Future<void> _refreshItems() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    setState(() {});
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    userData = Global.storageServices.getData(AppConstants.USER_DATA);
    if (userData != null) {
      // Use userData properties, e.g.
      print('User First Name: ${userData!.userFname}');
      print('User Last Name: ${userData!.userLname}');
      print('User Last enail: ${userData!.userEmail}');
    } else {
      print('the data is null');
      print(userData);
    }
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: RefreshIndicator(
        onRefresh: _refreshItems,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          height: 160,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/background.jpeg'),
                                fit: BoxFit.fill),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ReusableText(
                                    TextString:
                                        AppLocalizations.of(context)!.profile,
                                    FontSize: 30,
                                    FromLeft: 10,
                                    TextColor: ColorCollections.Black,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      CustomEditProfileShowDialogue(
                                          context, pickFile);
                                    },
                                    icon: Icon(Icons.edit_rounded),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      userData?.userImage != null
                          ? userData?.userImage is Uint8List
                              ? Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 80),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: ColorCollections.PrimaryColor,
                                      borderRadius: BorderRadius.circular(75),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(userData!.userImage!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 80),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: ColorCollections.PrimaryColor,
                                      borderRadius: BorderRadius.circular(75),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(userData!.userImage!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                )
                          : Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 80),
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: ColorCollections.PrimaryColor,
                                  borderRadius: BorderRadius.circular(75),
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: 100,
                                ),
                              ),
                            ),
                    ],
                  ),
                  userData?.userFname != null
                      ? Center(
                          child: ReusableText(
                            TextString:
                                userData!.userFname + " " + userData!.userLname,
                            FontSize: 25,
                            TextFontWeight: FontWeight.w600,
                            TextColor: ColorCollections.Black,
                          ),
                        )
                      : SmallshimmerEffect(),
                  ReusableText(
                    FromLeft: 20,
                    TextString: AppLocalizations.of(context)!.editAccount,
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  ReusableText(
                    FromLeft: 25,
                    TextString: AppLocalizations.of(context)!.name,
                    FontSize: 13,
                    TextColor: ColorCollections.Black,
                  ),
                  userData?.userFname != null
                      ? Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: ColorCollections.SecondaryColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: ReusableText(
                            FromLeft: 20,
                            FromTop: 10,
                            TextString:
                                userData!.userFname + userData!.userLname,
                            FontSize: 16,
                          ),
                        )
                      : SmallshimmerEffect(),
                  ReusableText(
                    FromLeft: 25,
                    TextString: AppLocalizations.of(context)!.email,
                    FontSize: 13,
                    TextColor: ColorCollections.Black,
                  ),
                  userData?.userEmail != null
                      ? Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: ColorCollections.SecondaryColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: ReusableText(
                            FromLeft: 20,
                            FromTop: 10,
                            TextString: userData!.userEmail,
                            FontSize: 16,
                          ),
                        )
                      : SmallshimmerEffect(),
                  InkWell(
                    onTap: () async {
                      await ApiService().GetAllUserFoundItem();
                    },
                    child: ReusableText(
                      FromLeft: 25,
                      TextString: 'Phone Number',
                      FontSize: 13,
                      TextColor: ColorCollections.Black,
                    ),
                  ),
                  userData?.userPhone != null
                      ? Container(
                          margin: EdgeInsets.only(left: 40),
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: ColorCollections.SecondaryColor,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: ReusableText(
                            FromLeft: 20,
                            FromTop: 10,
                            TextString: userData!.userPhone,
                            FontSize: 16,
                          ),
                        )
                      : SmallshimmerEffect(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //shimmer widget for name fields

  Widget SmallshimmerEffect() {
    print('shimmer');
    return Container(
      margin: EdgeInsets.only(left: 40),
      width: 250.0,
      height: 40.0,
      child: Shimmer.fromColors(
        baseColor: ColorCollections.SecondaryColor,
        highlightColor: const Color.fromARGB(255, 250, 249, 249),
        child: Container(
          decoration: BoxDecoration(
            color: ColorCollections.SecondaryColor,
            borderRadius: BorderRadius.circular(7),
          ),
          height: 40,
          width: 250,
        ),
      ),
    );
  }

  CustomEditProfileShowDialogue(BuildContext context, Uint8List? pickFile) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Stack(
              children: [
                SimpleDialog(
                  children: [
                    Center(
                      child: Container(
                        height: 150,
                        width: 250,
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.SecondaryColor,
                          image: pickFile != null
                              ? DecorationImage(image: MemoryImage(pickFile!))
                              : userData!.userImage != null &&
                                      userData!.userImage is! Uint8List
                                  ? DecorationImage(
                                      image: NetworkImage(userData!.userImage))
                                  : null,
                        ),
                        child: pickFile == null
                            ? IconButton(
                                onPressed: () async {
                                  var selectedFile =
                                      await pickedImages(ImageSource.gallery);
                                  if (selectedFile != null) {
                                    setState(() {
                                      pickFile = selectedFile;
                                      userData!.userImage = pickFile!;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 50,
                                ),
                              )
                            : null,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: reusableTextField(
                        icon_name: 'b_user',
                        hintText: 'Type first name',
                        textType: 'text',
                        onchange: (onchange) {
                          setState(() {
                            userData!.userFname = onchange;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      child: reusableTextField(
                        icon_name: 'b_user',
                        hintText: 'Type last name',
                        textType: 'text',
                        onchange: (onchange) {
                          setState(() {
                            userData!.userLname = onchange;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              isFinished = false;
                            });
                            String res = await ApiService().updatingUserRequest(
                                userData!.token['refreshToken'], userData!);
                            if (res == 'Perfect') {
                              _refreshPage();
                              Navigator.pop(context);
                            } else {
                              print(res);
                            }
                            setState(() {
                              isFinished = true;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorCollections.SecondaryColor,
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
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorCollections.TeritiaryColor,
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
                ),
                if (!isFinished)
                  ModalBarrier(
                    color: const Color.fromARGB(
                        137, 255, 255, 255), // Semi-transparent background
                    dismissible: false,
                    // Makes it indismisable
                  ),
                if (!isFinished)
                  Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  // Future _pickedImageFromGallery(ImageSource source) async {
  //   final filePicker = await ImagePicker().pickImage(source: source);
  //   if (filePicker == null) return;
  //   setState(() {
  //     pickFile = File(filePicker.path);
  //   });
  // }
}
