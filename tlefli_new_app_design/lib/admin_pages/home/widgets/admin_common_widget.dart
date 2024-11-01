import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlefli_new_app_design/admin_pages/getAllReportedItems/getallReportedItems.dart';
import 'package:tlefli_new_app_design/admin_pages/get_all_user/page/get_all_user_page.dart';
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
                  EdgeInsets.only(top: 50, left: 20, right: 10, bottom: 100),
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
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      'assets/icons/partners.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  ReusableText(
                    FromLeft: 15,
                    TextString: 'Add Partners',
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
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      'assets/icons/agreement.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  ReusableText(
                    FromLeft: 15,
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => getAllUsers(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      'assets/icons/users.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  ReusableText(
                    FromLeft: 15,
                    TextString: 'Get all user',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GetAllReportedItems(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      'assets/icons/report.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  ReusableText(
                    FromLeft: 15,
                    TextString: 'Get all reported item',
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
                  Icon(
                    Icons.logout_outlined,
                    size: 40,
                  ),
                  ReusableText(
                    FromLeft: 15,
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
