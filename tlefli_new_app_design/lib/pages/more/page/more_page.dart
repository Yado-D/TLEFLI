import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/pages/more/widget/more_widgets.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


Widget more_page(BuildContext context) {
  return ListView(
    children: [
      Container(
        margin: EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                    ),
                    ReusableText(
                      FromLeft: 40,
                      TextString: 'Settings',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/settings_page');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.question_mark_outlined,
                    ),
                    ReusableText(
                      FromLeft: 40,
                      TextString: 'FAQ',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/faq_page');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.cast_for_education_outlined,
                    ),
                    ReusableText(
                      FromLeft: 40,
                      TextString: 'Tutorials',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/tutorial_page');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              TextString: 'Our Future Partners',
              FontSize: 18,
              FromTop: 10,
              TextColor: const Color.fromARGB(255, 72, 72, 70),
              TextFontWeight: FontWeight.w600,
            ),
            partnersContainer('AEROBOT_RABART_SALE', 'AEROPORT_FESS_SAISS'),
            SizedBox(
              height: 10,
            ),
            partnersContainer('ALSA', 'AIROPORT_MOHAMMED'),
            SizedBox(
              height: 10,
            ),
            partnersContainer('ARRIBAT', 'ASWAK'),
            SizedBox(
              height: 10,
            ),
            partnersContainer('CARREFOUR', 'GTM'),
            SizedBox(
              height: 10,
            ),
            partnersContainer('MARJANE', 'ONCF'),
            SizedBox(
              height: 10,
            ),
            partnersContainer('TRAM', 'background'),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 100, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              TextString: 'Join us on social medias',
              FontSize: 18,
              TextColor: const Color.fromARGB(255, 72, 72, 70),
              TextFontWeight: FontWeight.w600,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpeg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
