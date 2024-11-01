import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common_category_model/widgets/map_of%20location.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/partner_location_choose_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/type_location.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/when_lost_page.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/editDescription.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class choose_location_page extends StatefulWidget {
  String page;
  itemPickedModel item_model;
  choose_location_page({
    super.key,
    required this.item_model,
    required this.page,
  });

  @override
  State<choose_location_page> createState() => _choose_location_pageState();
}

class _choose_location_pageState extends State<choose_location_page> {
  String? street;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          SimpleAppBars(context, AppLocalizations.of(context)!.addANewLocation),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        color: ColorCollections.PrimaryColor,
        child: ListView(
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
                        builder: (context) => type_location_page(
                          item_model: widget.item_model,
                        ),
                      ),
                    );
                    print(widget.item_model.city);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    // width: 200,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 219, 219)),
                    ),
                    // margin: EdgeInsets.only(left: 30),
                    child: ReusableText(
                      FromLeft: 20,
                      FromTop: 15,
                      TextString: widget.item_model.city ?? 'cities',
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 174, 174, 174),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: reusableTextField(
                    hintText: 'address',
                    textType: 'textType',
                    onchange: (onchange) {
                      setState(() {
                        widget.item_model.address = onchange;
                      });
                    },
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
                  Icons.airport_shuttle,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          item_model: widget.item_model,
                          type: 'Transportaion',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.airport,
                  Icons.local_airport,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          item_model: widget.item_model,
                          type: 'Airport',
                          map: transportaion,
                        ),
                      ),
                    );
                    print(widget.item_model.city);
                  },
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.townhallsPolice,
                  Icons.location_city,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          item_model: widget.item_model,
                          type: 'Town Halls',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
                common_partner_location(
                  AppLocalizations.of(context)!.shoppingCenters,
                  Icons.shopping_cart,
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => partner_location_page_(
                          item_model: widget.item_model,
                          type: 'Shopping Centers',
                          map: transportaion,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (widget.item_model.address == '') {
                  commonSnackBar(context, 'location is required!');
                } else {
                  if (widget.page == 'modifie') {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => EditDescription(
                          item_model: widget.item_model,
                        ),
                      ),
                      (route) => false,
                    );
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => lost_when_page(
                                item_model: widget.item_model,
                              )),
                    );
                  }
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 100, left: 30, right: 30),
                height: 40,
                width: 250,
                decoration: BoxDecoration(
                  color: ColorCollections.TeritiaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ReusableText(
                    TextString: AppLocalizations.of(context)!.next,
                    FontSize: 20,
                    TextColor: ColorCollections.PrimaryColor,
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
          color: ColorCollections.PrimaryColor,
          border: Border.all(color: const Color.fromARGB(255, 224, 225, 224)),
        ),
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
