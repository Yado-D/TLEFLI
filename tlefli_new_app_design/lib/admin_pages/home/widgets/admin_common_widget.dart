import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

Drawer AdminDrawer(BuildContext context) {
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
              Navigator.of(context).pushNamed('/add_partners_page');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(Icons.verified),
                  ReusableText(
                    FromLeft: 30,
                    TextString: 'Add Partners',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pushNamed('/remove_partners_page');
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(top: 20),
          //     child: Row(
          //       children: [
          //         Icon(Icons.remove_circle_outline),
          //         ReusableText(
          //           FromLeft: 30,
          //           TextString: 'Remove Partners',
          //           FontSize: 20,
          //           TextColor: ColorCollections.Black,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
