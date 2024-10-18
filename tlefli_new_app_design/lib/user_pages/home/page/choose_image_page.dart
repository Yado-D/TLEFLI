import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_main_catagory_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/pickImages.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class choose_image_page extends StatefulWidget {
  const choose_image_page({super.key});

  @override
  State<choose_image_page> createState() => _choose_image_pageState();
}

class _choose_image_pageState extends State<choose_image_page> {
  File? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'Choose image'),
      body: Container(
        padding: EdgeInsets.only(top: 80),
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    child: ReusableText(
                      TextString: 'What have you lost/found ?',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                    color: ColorCollections.PrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: pickedFile == null
                      ? Container(
                          height: 200,
                          width: 320,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  pickedFile = await _pickedImageFromGallery(
                                      ImageSource.gallery);
                                },
                                child: Choose_image_widget(
                                  'image-gallery',
                                  'choose from gallery',
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  pickedFile = await _pickedImageFromGallery(
                                      ImageSource.camera);
                                },
                                child: Choose_image_widget(
                                  'take-a-photo',
                                  'Take a photo',
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 200,
                          width: 300,
                          child: Image.file(
                            pickedFile!,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 50,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => choose_main_catagory_page(),
                  ));
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 100,
                    ),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCollections.TeritiaryColor,
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Next',
                        FontSize: 26,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _pickedImageFromGallery(ImageSource source) async {
    final filePicker = await ImagePicker().pickImage(source: source);
    if (filePicker == null) return;
    setState(() {
      pickedFile = File(filePicker.path);
    });
  }

  Widget Choose_image_widget(String icon, String text) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              dashPattern: [6, 3], // Length and space of dashes
              color: Colors.black, // Color of the dashed border
              strokeWidth: 2, // Width of the dashed border
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/icons/flat_icons/$icon.png'),
                ),
              ),
            ),
          ),
          ReusableText(
            TextString: '$text',
            FontSize: 14,
            TextColor: ColorCollections.Black,
          ),
        ],
      ),
    );
  }
}
