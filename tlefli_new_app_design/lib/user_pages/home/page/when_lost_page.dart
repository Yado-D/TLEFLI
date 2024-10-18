import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/input_description_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class lost_when_page extends StatelessWidget {
  const lost_when_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, ''),
      body: Stack(
        children: [
          Container(
            color: ColorCollections.SecondaryColor,
            padding: EdgeInsets.only(left: 15, right: 10, bottom: 15, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ReusableText(
                          TextString: 'When do you lost?',
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableText(
                  TextString: 'Choose The Date',
                  FontSize: 15,
                  TextColor: ColorCollections.Black,
                ),
                CommonDropdownButton(
                  choice1: 'Dec,20,2021',
                  choice2: 'Jan,20,2022',
                  choice3: 'Oct,22,2021',
                  // ignore: avoid_print
                  onChanged: (value) => print(value),
                ),
                ReusableText(
                  TextString: 'Choose The time',
                  FontSize: 15,
                  TextColor: ColorCollections.Black,
                ),
                CommonDropdownButton(
                  choice1: '12:03',
                  choice2: '34:56',
                  choice3: '43:16',
                  // ignore: avoid_print
                  onChanged: (value) => print(value),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 35,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        input_description_page(categorie: 'Pets'),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 350, left: 30, right: 30),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: ColorCollections.PrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ReusableText(
                    TextString: 'Next',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
