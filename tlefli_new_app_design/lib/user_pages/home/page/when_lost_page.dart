import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/input_description_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class lost_when_page extends StatefulWidget {
  itemPickedModel item_model;
  lost_when_page({super.key, required this.item_model});

  @override
  State<lost_when_page> createState() => _lost_when_pageState();
}

class _lost_when_pageState extends State<lost_when_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar:
          SimpleAppBars(context, AppLocalizations.of(context)!.chooseTheTime),
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
                          TextString:
                              AppLocalizations.of(context)!.whenDoYouLost,
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableText(
                  TextString: AppLocalizations.of(context)!.chooseTheDate,
                  FontSize: 15,
                  TextColor: ColorCollections.Black,
                ),
                CommonDropdownButtons(
                    items: date,
                    // ignore: avoid_print
                    onChanged: (value) {
                      print(value);
                      widget.item_model.date_picked = value;
                      setState(() {});
                    }),
                ReusableText(
                  TextString: AppLocalizations.of(context)!.chooseTheTime,
                  FontSize: 15,
                  TextColor: ColorCollections.Black,
                ),
                CommonDropdownButtons(
                  items: time,
                  // ignore: avoid_print
                  onChanged: (value) {
                    print(value);
                    widget.item_model.time_picked = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => input_description_page(
                        categorie: 'Pets', item_model: widget.item_model),
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
                    TextString: AppLocalizations.of(context)!.next,
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

  List<String> time = [
    '23:3',
    '23:2',
    '23:4',
    '23:5',
    '23:6',
  ];

  List<String> date = [
    'oct,30,2024',
    'oct,30,2023',
    'oct,30,2022',
    'oct,30,2021',
    'oct,30,2025',
  ];
}
