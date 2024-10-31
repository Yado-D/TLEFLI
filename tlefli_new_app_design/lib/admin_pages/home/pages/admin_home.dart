import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common_category_model/widgets/map_of%20location.dart';
import 'package:tlefli_new_app_design/admin_pages/home/widgets/admin_common_widget.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/partners_pages/common_p/partner_common_widgets.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class admin_home_page extends StatefulWidget {
  const admin_home_page({super.key});

  @override
  State<admin_home_page> createState() => _admin_home_pageState();
}

class _admin_home_pageState extends State<admin_home_page> {
  Future<void> _refreshItems() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> globalKey = GlobalKey();
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      key: globalKey,
      appBar: PartnerReusableAppBar(
        () {
          globalKey.currentState!.openDrawer();
        },
        context,
        'Admin home',
      ),
      drawer: AdminDrawer(context),
      body: RefreshIndicator(
        onRefresh: _refreshItems,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    TextString: 'Welcome back Admin',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                  Center(
                    child: ReusableText(
                      TextString: 'Partners List',
                      FontSize: 20,
                      FromBottom: 15,
                      TextColor: ColorCollections.Black,
                      TextFontWeight: FontWeight.bold,
                    ),
                  ),
                  ReusableText(
                    TextString: 'Airport partner',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  common_admin_Partner_container(
                    airport,
                  ),
                  ReusableText(
                    TextString: 'Transportation partner',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  common_admin_Partner_container(
                    transportaion,
                  ),
                  ReusableText(
                    TextString: 'Shopping partner',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  common_admin_Partner_container(
                    shopping,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget common_admin_Partner_container(
    Map<String, dynamic> map,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints.fromViewConstraints(
        ViewConstraints(
          maxHeight: 320,
          maxWidth: 400,
        ),
      ),
      child: Container(
        child: ListView.builder(
          itemCount: map['assets'].length,
          itemBuilder: (context, index) {
            String image_name = map['assets'][index];
            String name = map['txt'][index];
            return GestureDetector(
              onTap: () {
                showDialogue_widget(context, index, map);
              },
              child: Container(
                height: 80,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: ColorCollections.PrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              'assets/images/partners/${image_name}.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Center(
                        child: ReusableText(
                          TextColor: ColorCollections.Black,
                          TextString: name,
                          FontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> showDialogue_widget(
    BuildContext context,
    int index,
    Map<String, dynamic> map,
  ) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                height: 220,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      TextString: 'Are you sure you want to delete this item ?',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              map['assets'].remove([index]);
                              map['txt'].remove([index]);
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: ColorCollections.SecondaryColor,
                                borderRadius: BorderRadius.circular(10),
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
                              width: 120,
                              decoration: BoxDecoration(
                                color: ColorCollections.TeritiaryColor,
                                borderRadius: BorderRadius.circular(10),
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
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
