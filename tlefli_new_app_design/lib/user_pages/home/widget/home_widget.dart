import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_image_page.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget home_widget(BuildContext context, Animation<Offset> animation) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 0),
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ReusableText(
                FromTop: 20,
                TextString: 'Have you lost or found an item?',
                FontSize: 23,
                TextColor: Color(0xFF003540),
                TextFontWeight: FontWeight.bold,
              ),
              ReusableText(
                TextString: AppLocalizations.of(context)!.letsReconnect,
                FontSize: 19,
                TextColor: Color(0xFF003540),
                TextFontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => choose_image_page(
                lostOrFound: 'lost',
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 50, bottom: 60),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 45,
                width: 250,
                decoration: BoxDecoration(
                  color: ColorCollections.TeritiaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: ReusableText(
                        // FromLeft: 30,
                        TextString: AppLocalizations.of(context)!.iLost,
                        TextColor: ColorCollections.PrimaryColor,
                        FontSize: 24,
                        TextFontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => choose_image_page(
                        lostOrFound: 'found',
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 45,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 36, 174, 89),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: ReusableText(
                          // FromLeft: 30,
                          TextString: AppLocalizations.of(context)!.iFound,
                          TextColor: const Color.fromARGB(255, 255, 255, 255),
                          FontSize: 24,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ),
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
