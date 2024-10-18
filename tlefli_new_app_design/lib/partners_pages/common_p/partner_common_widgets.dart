import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

AppBar PartnerReusableAppBar(
    VoidCallback ontap, BuildContext context, String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorCollections.PrimaryColor,
    title: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 35.h,
              width: 35.w,
              child: Image.asset(
                'assets/icons/flat_icons/menu-bar.png',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableText(
                FromLeft: 70,
                TextString: title,
                FontSize: 20,
                TextColor: ColorCollections.Black,
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Drawer partnersDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: ColorCollections.SecondaryColor,
      padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 30),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin:
                  EdgeInsets.only(top: 30, left: 20, right: 10, bottom: 100),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/verified_items_page');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.verified),
                  ReusableText(
                    FromLeft: 30,
                    TextString: 'Verified items',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/rejected_items_page');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.remove_circle_outline),
                  ReusableText(
                    FromLeft: 30,
                    TextString: 'Rejected items',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/agreement_page');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.contrast_outlined),
                  ReusableText(
                    FromLeft: 30,
                    TextString: 'Agreements',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/sign_in_page');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.logout_outlined),
                  ReusableText(
                    FromLeft: 30,
                    TextString: 'Log Out',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
