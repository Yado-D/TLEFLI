import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/home_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class my_match_page extends StatelessWidget {
  final Animation<Offset> animation;
  const my_match_page({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ReusableText(
              TextString: AppLocalizations.of(context)!.yourFirstMatch,
              FontSize: 20,
              TextColor: ColorCollections.Black,
              FromTop: 100,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
            height: 300,
            width: 300,
            // color: ColorCollections.PrimaryColor,
            child: Lottie.asset('assets/images/report.json'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      home_widgets(context, animation: animation),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 28, bottom: 15),
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                color: Color(0xFF003540),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: ReusableText(
                  TextString: AppLocalizations.of(context)!.report,
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
