import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/home_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class my_match_page extends StatefulWidget {
  final Animation<Offset> animation;
  const my_match_page({super.key, required this.animation});

  @override
  State<my_match_page> createState() => _my_match_pageState();
}

class _my_match_pageState extends State<my_match_page> {
//get user data

  UserData? userData = Global.storageServices.getData(AppConstants.USER_DATA);

  @override
  Widget build(BuildContext context) {
    final res = ApiService().getUserMatch(userData!);
    // print(res);
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: FutureBuilder(
          future: res,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
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
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 15),
                    height: 300,
                    width: 300,
                    // color: ColorCollections.PrimaryColor,
                    child: Lottie.asset('assets/images/report.json'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: ReusableText(
                  TextString: 'Something is not Good. please try again later',
                  FontSize: 16,
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ReusableText(
                        TextString:
                            AppLocalizations.of(context)!.yourFirstMatch,
                        FontSize: 20,
                        TextColor: Color(0xFF003540),
                        FromTop: 100,
                        TextFontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 15),
                      height: 300,
                      width: 300,
                      // color: ColorCollections.PrimaryColor,
                      child: Lottie.asset('assets/images/report.json'),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
