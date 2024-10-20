import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of%20location.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/partner_location_choose_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/type_location.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/when_lost_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class choose_location_page extends StatelessWidget {
  const choose_location_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          SimpleAppBars(context, AppLocalizations.of(context)!.addANewLocation),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        color: ColorCollections.SecondaryColor,
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        // bottomSheetCatagoryPage(context);
                      },
                      icon: Icon(Icons.location_pin),
                    ),
                    ReusableText(
                      FromRight: 10,
                      TextString:
                          AppLocalizations.of(context)!.indicateTheLossArea,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      FromRight: 30,
                      TextString: AppLocalizations.of(context)!.youCanMatchWith,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => type_location_page()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 290,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    // width: 200,
                    decoration: BoxDecoration(
                        color: ColorCollections.PrimaryColor,
                        borderRadius: BorderRadius.circular(7)),
                    // margin: EdgeInsets.only(left: 30),
                    child: ReusableText(
                      FromLeft: 20,
                      FromTop: 15,
                      TextString: AppLocalizations.of(context)!.typeTheLocation,
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 104, 104, 103),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    IconButton(
                      onPressed: () {
                        // bottomSheetCatagoryPage(context);
                      },
                      icon: Icon(Icons.flag),
                    ),
                    ReusableText(
                      FromRight: 10,
                      TextString: AppLocalizations.of(context)!.selectAPartner,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.transport,
                  Icons.car_crash_outlined,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          type: 'Transportaion',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.airport,
                  Icons.airport_shuttle,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          type: 'Airport',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.townhallsPolice,
                  Icons.two_mp_outlined,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          type: 'Town Halls',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.shoppingCenters,
                  Icons.abc_rounded,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          type: 'Shopping Centers',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => lost_when_page()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 100, left: 30, right: 30),
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
      ),
    );
  }

  Widget common_partner_location(
    String partnerTxt,
    IconData icon,
    VoidCallback ontap,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorCollections.PrimaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                // bottomSheetCatagoryPage(context);
              },
              icon: Icon(icon),
            ),
            ReusableText(
              FromLeft: 70,
              FromRight: 10,
              TextString: partnerTxt,
              FontSize: 15,
              TextColor: ColorCollections.Black,
            ),
          ],
        ),
      ),
    );
  }

  type_location(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Scaffold(
              body: ListView(
                children: [
                  Container(
                    child: ReusableText(
                      TextString: 'TextString',
                      FontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
