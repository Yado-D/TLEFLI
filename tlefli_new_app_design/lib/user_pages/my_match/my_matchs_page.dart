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

  Future<List<Map<String, dynamic>>> findMatchingItems() async {
    try {
      Map<String, dynamic> foundItemsResponse =
          await ApiService().GetAllUserFoundItem();
      Map<String, dynamic> userItemsResponse =
          await ApiService().GetLostOrFoundItemsForUser(
        userData!,
        userData!.token['refreshToken'],
      );

      List<Map<String, dynamic>> foundItems = foundItemsResponse['items'];
      List<Map<String, dynamic>> userItems = userItemsResponse['items'];

      List<Map<String, dynamic>> matchingItems = [];

      for (var foundItem in foundItems) {
        for (var userItem in userItems) {
          if (foundItem['itemName'] == userItem['itemName'] &&
              foundItem['location'] == userItem['location'] &&
              foundItem['category'] == userItem['category'] &&
              foundItem['subcategory'] == userItem['subcategory']) {
            matchingItems.add(foundItem);
          }
        }
      }

      return matchingItems;
    } catch (e) {
      return [
        {"Error": 'Error: ${e.toString()}'}
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      body: FutureBuilder(
          future: findMatchingItems(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => home_widgets(context,
                              animation: widget.animation),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 28, bottom: 15),
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
              );
            } else if (snapshot.hasError) {
              return Center(
                child: ReusableText(
                  TextString: 'Something is not Good. please try again later',
                  FontSize: 16,
                ),
              );
            } else {
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => home_widgets(context,
                              animation: widget.animation),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 28, bottom: 15),
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
              );
            }
          }),
    );
  }
}
