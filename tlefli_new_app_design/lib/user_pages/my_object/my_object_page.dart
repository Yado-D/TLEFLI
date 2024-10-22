import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/list_of_my_object.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class my_object_page extends StatefulWidget {
  const my_object_page({super.key});

  @override
  State<my_object_page> createState() => _my_object_pageState();
}

class _my_object_pageState extends State<my_object_page> {
  @override
  void initState() {
    //featch the data from database in the itemPickedModel
    //  Future<void> getMyObjectValue()async{
    //     my_object
    //  }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: ListView(
        children: my_object.isEmpty
            ? [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ReusableText(
                        FromTop: 350,
                        TextString: 'No request made.',
                        FontSize: 20,
                      ),
                    ),
                  ],
                )
              ]
            : my_object
                .map((object) => Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: ColorCollections.PrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              object.pickedImage != null
                                  ? Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              MemoryImage(object.pickedImage!),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/images/background.jpeg'),
                                        ),
                                      ),
                                    ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10, left: 10),
                                    padding: EdgeInsets.only(
                                        top: 10, left: 15, right: 15),
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/logos/tlefli_app.jpg'),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          ReusableText(
                            FromBottom: 2,
                            TextColor: ColorCollections.Black,
                            TextString: AppLocalizations.of(context)!.cat,
                            FontSize: 20,
                          ),
                          ReusableText(
                            FromBottom: 2,
                            TextColor: ColorCollections.Black,
                            TextString: object.main_catagory ?? '',
                            FontSize: 20,
                          ),
                          // ReusableText(
                          //   FromBottom: 2,
                          //   TextColor: ColorCollections.Black,
                          //   TextString: 'Yared',
                          //   FontSize: 20,
                          // ),
                        ],
                      ),
                    ))
                .toList(),
      ),
    );
  }
}
