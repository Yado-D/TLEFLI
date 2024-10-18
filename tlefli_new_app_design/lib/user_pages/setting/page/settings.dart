import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class settings_page extends StatelessWidget {
  const settings_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'Settings'),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 240,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.PrimaryColor),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      TextString: 'Notification Settings',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ReusableText(
                              FromBottom: 0,
                              TextString: 'Push Notification',
                              FontSize: 16,
                              TextColor: ColorCollections.Black,
                            ),
                            ReusableText(
                              FromTop: 0,
                              TextString: 'Allow Push Notification',
                              FontSize: 10,
                              TextColor: ColorCollections.Black,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                          height: 26,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: ColorCollections.TeritiaryColor,
                              activeTrackColor: ColorCollections.SecondaryColor,
                              value: false,
                              onChanged: (bool value1) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        width: 250,
                        color: ColorCollections.SecondaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ReusableText(
                              FromBottom: 0,
                              TextString: 'chat Notification',
                              FontSize: 16,
                              TextColor: ColorCollections.Black,
                            ),
                            ReusableText(
                              FromTop: 0,
                              TextString: 'Allow chat Notification',
                              FontSize: 10,
                              TextColor: ColorCollections.Black,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                          height: 26,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: ColorCollections.TeritiaryColor,
                              activeTrackColor: ColorCollections.SecondaryColor,
                              value: false,
                              onChanged: (bool value1) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        width: 250,
                        color: ColorCollections.SecondaryColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            ReusableText(
                              FromBottom: 0,
                              TextString: 'Email Notification',
                              FontSize: 16,
                              TextColor: ColorCollections.Black,
                            ),
                            ReusableText(
                              FromTop: 0,
                              TextString: 'Allow email Notification',
                              FontSize: 10,
                              TextColor: ColorCollections.Black,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 50,
                          height: 26,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Switch(
                              activeColor: ColorCollections.TeritiaryColor,
                              activeTrackColor: ColorCollections.SecondaryColor,
                              value: false,
                              onChanged: (bool value1) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 1,
                        width: 250,
                        color: ColorCollections.SecondaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              height: 220,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.PrimaryColor),
              child: Column(
                children: [
                  ReusableText(
                    TextString: 'Support',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                    FromBottom: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        TextString: 'Help',
                        FontSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/help_page');
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 1,
                      width: 250,
                      color: ColorCollections.SecondaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        TextString: 'Contact Us',
                        FontSize: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/contact_us_page');
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 1,
                      width: 250,
                      color: ColorCollections.SecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.TeritiaryColor),
              child: Center(
                child: ReusableText(
                  TextString: 'Log Out',
                  FontSize: 20,
                  TextColor: ColorCollections.PrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
