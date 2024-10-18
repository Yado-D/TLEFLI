import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class about_us_page extends StatelessWidget {
  const about_us_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'About Us'),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorCollections.PrimaryColor),
              child: Column(
                children: [
                  Center(
                    child: ReusableText(
                      FromTop: 20,
                      TextString: 'TLEFLI',
                      FontSize: 20,
                      TextFontWeight: FontWeight.bold,
                      TextColor: ColorCollections.Black,
                    ),
                  ),
                  ReusableText(
                    FromTop: 10,
                    TextString:
                        'Welcome to TLEFLI, your smart solution\nfor lost and found items. Our innovative\napp streamlines the reporting process for\n individuals and organizations ,allowing\n users to easily submit details about lost\n or found items, including descriptions,\n locations, and photos.',
                    FontSize: 15,
                    TextFontWeight: FontWeight.w600,
                    TextColor: const Color.fromARGB(255, 86, 89, 86),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
