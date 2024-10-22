import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  File? pickFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                          image: AssetImage('assets/images/background.jpeg'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReusableText(
                              TextString: AppLocalizations.of(context)!.profile,
                              FontSize: 30,
                              FromLeft: 10,
                              TextColor: ColorCollections.Black,
                            ),
                            IconButton(
                              onPressed: () {
                                CustomEditProfileShowDialogue(context);
                              },
                              icon: Icon(Icons.edit_rounded),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Center(
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
            ReusableText(
              FromLeft: 110,
              TextString: 'Yared Dereje',
              FontSize: 25,
              TextFontWeight: FontWeight.w600,
              TextColor: ColorCollections.Black,
            ),
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
            Container(
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
                TextString: 'Yared Dereje',
                FontSize: 16,
              ),
            ),
            ReusableText(
              FromLeft: 25,
              TextString: AppLocalizations.of(context)!.email,
              FontSize: 13,
              TextColor: ColorCollections.Black,
            ),
            Container(
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
                TextString: 'YaredDereje780@gmail.com',
                FontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomEditProfileShowDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              pickFile == null
                  ? Center(
                      child: Container(
                        height: 150,
                        width: 250,
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.SecondaryColor,
                        ),
                        child: IconButton(
                          onPressed: () async {
                            await _pickedImageFromGallery(ImageSource.gallery);
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                          ),
                        ),
                      ),
                    )
                  : Image.file(
                      pickFile!,
                      height: 150,
                      width: 250,
                    ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
                child: reusableTextField(
                  icon_name: 'b_user',
                  hintText: 'type your new username',
                  textType: 'text',
                  onchange: (onchange) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 10),
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
                      margin: EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 10),
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
              )
            ],
          );
        });
  }

  Future _pickedImageFromGallery(ImageSource source) async {
    final filePicker = await ImagePicker().pickImage(source: source);
    if (filePicker == null) return;
    setState(() {
      pickFile = File(filePicker.path);
    });
  }
}
