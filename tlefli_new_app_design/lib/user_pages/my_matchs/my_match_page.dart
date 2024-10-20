import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class my_match_page extends StatelessWidget {
  const my_match_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            decoration: BoxDecoration(
              color: ColorCollections.PrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk1PDAz6WWS34_z9zcR5gcueGXL_3hcC0lPA&s'),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          padding: EdgeInsets.only(top: 10, left: 10),
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/logos/tlefli_app.jpg'),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ReusableText(
                  FromBottom: 2,
                  TextColor: ColorCollections.Black,
                  TextString: AppLocalizations.of(context)!.cat,
                  FontSize: 20,
                ),
                ReusableText(
                  FromBottom: 2,
                  TextColor: ColorCollections.Black,
                  TextString: '11/22/2012',
                  FontSize: 20,
                ),
                ReusableText(
                  FromBottom: 2,
                  TextColor: ColorCollections.Black,
                  TextString: 'Yared',
                  FontSize: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
