import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/Bottomsheets/pages/bottom_sheet.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


Widget home_widget(BuildContext context) {
  return Column(
    children: [
      Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ReusableText(
              FromTop: 20,
              TextString: 'Lost or Found?',
              FontSize: 28,
              TextColor: ColorCollections.Black,
              TextFontWeight: FontWeight.bold,
            ),
            ReusableText(
              TextString: 'Let\'s Reconnect!',
              FontSize: 19,
              TextColor: ColorCollections.Black,
              TextFontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 50),
        height: 200,
        width: 300,
        decoration: BoxDecoration(color: ColorCollections.SecondaryColor),
        child: Image.asset(
          'assets/images/lost3.png',
          fit: BoxFit.fill,
        ),
      ),
      GestureDetector(
        onTap: () {
          MostBottomSheetWidget.CustomBottomSheet(
            context,
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 90),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: ColorCollections.PrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      TextString: 'I Lost',
                      TextColor: ColorCollections.Black,
                      FontSize: 24,
                      TextFontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  MostBottomSheetWidget.CustomBottomSheet(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: ColorCollections.TeritiaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ReusableText(
                        FromLeft: 30,
                        TextString: 'I Found',
                        TextColor: const Color.fromARGB(255, 255, 255, 255),
                        FontSize: 24,
                        TextFontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorCollections.PrimaryColor,
                            size: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: ColorCollections.PrimaryColor,
                            size: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
