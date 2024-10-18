import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class language_page extends StatelessWidget {
  const language_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'Language'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 35, right: 15, top: 60),
            height: 60,
            width: 250,
            decoration: BoxDecoration(
              color: ColorCollections.PrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField<String>(
              padding: EdgeInsets.only(left: 15, right: 15),
              isExpanded: true,
              value: 'English',
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.language,
                    size: 35,
                    color: ColorCollections.TeritiaryColor,
                  ),
                ),
              ),
              hint: Text('Please choose account type'),
              items: [
                DropdownMenuItem(
                  value: 'English',
                  child: ReusableText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: 'English',
                    FontSize: 16,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'French',
                  child: ReusableText(
                    FromBottom: 0,
                    FromTop: 0,
                    TextString: 'French',
                    FontSize: 16,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Bangladish',
                  child: ReusableText(
                    FromBottom: 0,
                    FromTop: 0,
                    TextString: 'Bangladish',
                    FontSize: 16,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                DropdownMenuItem(
                  value: 'Chinish',
                  child: ReusableText(
                    FromBottom: 0,
                    FromTop: 0,
                    TextString: 'Chinish',
                    FontSize: 16,
                    TextColor: ColorCollections.Black,
                  ),
                ),
              ],
              onChanged: (_) {},
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorCollections.TeritiaryColor),
              child: Center(
                child: ReusableText(
                  TextString: 'Apply',
                  FontSize: 20,
                  TextColor: ColorCollections.PrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
