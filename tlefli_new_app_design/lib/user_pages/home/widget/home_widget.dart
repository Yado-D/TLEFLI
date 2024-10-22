import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tlefli_new_app_design/Bottomsheets/pages/bottom_sheet.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_image_page.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home_widgets extends StatelessWidget {
  final Animation<Offset> animation;
  const home_widgets(BuildContext context,
      {super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, ''),
      backgroundColor: ColorCollections.SecondaryColor,
      body: Column(
        children: [
          Row(),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ReusableText(
                  FromTop: 20,
                  TextString: AppLocalizations.of(context)!.lostOrFound,
                  FontSize: 28,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.bold,
                ),
                ReusableText(
                  TextString: AppLocalizations.of(context)!.letsReconnect,
                  FontSize: 19,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(),
            height: 250,
            width: 250,
            decoration: BoxDecoration(color: ColorCollections.SecondaryColor),
            child: Lottie.asset('assets/images/new.json'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => choose_image_page(),
                ),
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
                      color: ColorCollections.TeritiaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ReusableText(
                          FromLeft: 30,
                          TextString: AppLocalizations.of(context)!.iLost,
                          TextColor: ColorCollections.PrimaryColor,
                          FontSize: 24,
                          TextFontWeight: FontWeight.bold,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Row(
                            children: [
                              SlideTransition(
                                position: animation,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorCollections.PrimaryColor,
                                  size: 20,
                                ),
                              ),
                              SlideTransition(
                                position: animation,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorCollections.PrimaryColor,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => choose_image_page()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 36, 174, 89),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ReusableText(
                            FromLeft: 30,
                            TextString: AppLocalizations.of(context)!.iFound,
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
      ),
    );
    ;
  }
}

Widget home_widget(BuildContext context, Animation<Offset> animation) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 30),
        height: 120,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ReusableText(
              FromTop: 20,
              TextString: AppLocalizations.of(context)!.lostOrFound,
              FontSize: 28,
              TextColor: ColorCollections.Black,
              TextFontWeight: FontWeight.bold,
            ),
            ReusableText(
              TextString: AppLocalizations.of(context)!.letsReconnect,
              FontSize: 19,
              TextColor: ColorCollections.Black,
              TextFontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(),
        height: 250,
        width: 250,
        decoration: BoxDecoration(color: ColorCollections.SecondaryColor),
        child: Lottie.asset('assets/images/new.json'),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => choose_image_page()),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 100),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 50,
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
                    // Container(
                    //   margin: EdgeInsets.only(right: 15),
                    //   child: Row(
                    //     children: [
                    //       SlideTransition(
                    //         position: animation,
                    //         child: Icon(
                    //           Icons.arrow_forward_ios,
                    //           color: ColorCollections.PrimaryColor,
                    //           size: 20,
                    //         ),
                    //       ),
                    //       SlideTransition(
                    //         position: animation,
                    //         child: Icon(
                    //           Icons.arrow_forward_ios,
                    //           color: ColorCollections.PrimaryColor,
                    //           size: 20,
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => choose_image_page()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 50,
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
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: ColorCollections.PrimaryColor,
                      //       size: 20,
                      //     ),
                      //     Icon(
                      //       Icons.arrow_forward_ios,
                      //       color: ColorCollections.PrimaryColor,
                      //       size: 20,
                      //     )
                      //   ],
                      // )
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
