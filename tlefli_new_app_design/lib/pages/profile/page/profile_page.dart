import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class profile_page extends StatelessWidget {
  const profile_page({super.key});

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
                    margin: EdgeInsets.only( top: 20),
                    height: 150,
                    width: 320,
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
                              TextString: 'Profile',
                              FontSize: 30,
                              FromLeft: 10,
                              TextColor: ColorCollections.Black,
                            ),
                            IconButton(
                              onPressed: () {},
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
                    margin: EdgeInsets.only( top: 80),
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
              TextString: 'Edit Account',
              FontSize: 18,
              TextColor: ColorCollections.Black,
            ),
            ReusableText(
              FromLeft: 25,
              TextString: 'Name',
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
              TextString: 'Email',
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
}
