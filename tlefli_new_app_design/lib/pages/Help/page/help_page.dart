import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/pages/faq/page/faq_page.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class HelpSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'Help'),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCollections.PrimaryColor,
              ),
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                  title: Text(
                    'FAQs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorCollections.Black,
                    ),
                  ),
                  tileColor:
                      Colors.grey[200], // Change the background color as needed
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('/faq_page');
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCollections.PrimaryColor,
              ),
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: Text(
                  'Tutorials',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorCollections.Black,
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TutorialsSection())),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCollections.PrimaryColor,
              ),
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: Text(
                  'Trobleshooting Tips',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorCollections.Black,
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TroubleshootingSection())),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCollections.PrimaryColor,
              ),
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: Text(
                  'Contact Support',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorCollections.Black,
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () =>
                    Navigator.of(context).pushNamed('/contact_us_page'),
              ),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCollections.PrimaryColor,
              ),
              padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
              width: 350,
              child: ListTile(
                title: Text(
                  'User Manual',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorCollections.Black,
                  ),
                ),
                tileColor:
                    Colors.grey[200], // Change the background color as needed
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserManualSection())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
