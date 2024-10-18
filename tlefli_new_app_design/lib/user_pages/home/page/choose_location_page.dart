import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of%20location.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/when_lost_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class choose_location_page extends StatelessWidget {
  const choose_location_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'Add a new location'),
      body: Container(
        color: ColorCollections.SecondaryColor,
        child: Stack(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                      TextString: 'Indicate the loss area',
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
                      TextString:
                          'You can match with an individual\n or in one of our partner location',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  // width: 200,
                  decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(7)),
                  // margin: EdgeInsets.only(left: 30),
                  child: DropdownButtonFormField(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    isExpanded: true,
                    decoration: InputDecoration(border: InputBorder.none),
                    focusColor: const Color.fromARGB(255, 237, 236, 236),
                    style: TextStyle(color: ColorCollections.Black),
                    // value:
                    //     state is ItemNameState ? state.itemName! : 'None',
                    value: 'None',
                    items: [
                      DropdownMenuItem(
                        value: 'None',
                        child: ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          TextColor: ColorCollections.Black,
                          TextString: 'None',
                          FontSize: 16,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Hotel Le Six',
                        child: ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          TextColor: ColorCollections.Black,
                          TextString: 'Hotel Le Six',
                          FontSize: 16,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Pullman Paris Tour Eiffel',
                        child: ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          TextColor: ColorCollections.Black,
                          TextString: 'Pullman Paris Tour Eiffel',
                          FontSize: 16,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Trainline',
                        child: ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          TextColor: ColorCollections.Black,
                          TextString: 'Trainline',
                          FontSize: 16,
                        ),
                      ),
                    ],
                    onChanged: (onChanged) {
                      // context
                      //     .read<ILostBloc>()
                      //     .add(ItemNameEvent(itemName: onChanged));
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
                      TextString: 'Select a partner location directly',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                common_partner_location(
                  'Transport',
                  Icons.car_crash_outlined,
                  () {
                    commonPartnerLocationClicked(
                      context,
                      'Location of Transportaion',
                      transportaion,
                    );
                  },
                ),
                common_partner_location(
                  'Airport',
                  Icons.airport_shuttle,
                  () {
                    commonPartnerLocationClicked(
                      context,
                      'Location of Airport',
                      airport,
                    );
                  },
                ),
                common_partner_location(
                  'Town halls/Police',
                  Icons.two_mp_outlined,
                  () {
                    commonPartnerLocationClicked(
                      context,
                      'Location of Town halls/Police',
                      towns,
                    );
                  },
                ),
                common_partner_location(
                  'Shopping Centers',
                  Icons.abc_rounded,
                  () {
                    commonPartnerLocationClicked(
                      context,
                      'Location of Shopping Centers',
                      shopping,
                    );
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 35,
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
                      TextString: 'Next',
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
}
