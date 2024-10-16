//for choosing location

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of%20location.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of_categories.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class MostBottomSheetWidget {
  static late BuildContext context;

  MostBottomSheetWidget({required BuildContext newContext}) {
    context = newContext;
  }

  static ChooseLocationButtomSheet(BuildContext context, String category) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  color: ColorCollections.SecondaryColor,
                  child: ListView(
                    children: [
                      Container(
                        color: ColorCollections.SecondaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                CommonSpecificBottomSheetContainer(
                                  context,
                                  CategoriesList.map((e) {
                                    if (e[0]['item'] == category) {
                                      return e[0];
                                    }
                                    return null; // Return null if the condition is not met
                                  })
                                      .where((element) => element != null)
                                      .cast<Map<String, dynamic>>()
                                      .toList(),
                                );
                              },
                              icon: Icon(Icons.arrow_back),
                            ),
                            ReusableText(
                              FromLeft: 40,
                              FromRight: 70,
                              TextString: 'Add a new location',
                              FontSize: 20,
                              TextColor: ColorCollections.Black,
                            ),
                          ],
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
                      ReusableText(
                        FromLeft: 20,
                        FromRight: 30,
                        TextString:
                            'You can match with an individual\n or in one of our partner location',
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        width: 200,
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
                      CommonPartnerLocation(
                        'Transport',
                        Icons.car_crash_outlined,
                        () {
                          commonPartnerLocationClicked(
                              context,
                              'Location of Transportaion',
                              transportaion,
                              category);
                        },
                      ),
                      CommonPartnerLocation(
                        'Airport',
                        Icons.airport_shuttle,
                        () {
                          commonPartnerLocationClicked(context,
                              'Location of Airport', airport, category);
                        },
                      ),
                      CommonPartnerLocation(
                        'Town halls/Police',
                        Icons.two_mp_outlined,
                        () {
                          commonPartnerLocationClicked(context,
                              'Location of Town halls/Police', towns, category);
                        },
                      ),
                      CommonPartnerLocation(
                        'Shopping Centers',
                        Icons.abc_rounded,
                        () {
                          commonPartnerLocationClicked(
                              context,
                              'Location of Shopping Centers',
                              shopping,
                              category);
                        },
                      ),
                      // CommonPartnerLocation(
                      //   'Other Location',
                      //   Icons.privacy_tip,
                      //   () {
                      //     commonPartnerLocationClicked(
                      //       context,
                      //       'Location of Town halls/Police',
                      //       towns,
                      //     );
                      //   },
                      // ),
                      GestureDetector(
                        onTap: () {
                          ChooseWhen(context, category);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(top: 100, left: 30, right: 30),
                          height: 40,
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
                    ],
                  ),
                );
              });
        });
  }

  static CommonPartnerLocation(
      String partnerTxt, IconData icon, VoidCallback ontap) {
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

  static commonPartnerLocationClicked(
    BuildContext context,
    String type,
    Map<String, dynamic> map,
    String categorie,
  ) {
    showBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ChooseLocationButtomSheet(context, categorie);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                          ReusableText(
                            FromLeft: 40,
                            TextString: type,
                            FontSize: 20,
                            TextColor: ColorCollections.Black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      LocationContainer(
                          // 'AEROBOT_RABART_SALE',
                          // 'AEROBOT RABART SALE',
                          () {
                        ChooseLocationButtomSheet(context, categorie);
                      }, map),
                    ],
                  ),
                );
              });
        });
  }

  static LocationContainer(VoidCallback ontap, Map<String, dynamic> map) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: map['assets'].length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ontap,
            child: Container(
              height: 70,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.PrimaryColor),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/partners/${map['assets'][index]}.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  ReusableText(
                    FromLeft: 15,
                    TextString: map['txt'][index],
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static ChooseWhen(BuildContext context, String categorie) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  color: ColorCollections.SecondaryColor,
                  padding: EdgeInsets.only(left: 15, right: 10, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: ColorCollections.SecondaryColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      ChooseLocationButtomSheet(
                                          context, categorie);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: ReusableText(
                                TextString: 'When do you lost?',
                                FontSize: 20,
                                TextColor: ColorCollections.Black,
                                TextFontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ReusableText(
                        TextString: 'Choose The Date',
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButton(
                        choice1: 'Dec,20,2021',
                        choice2: 'Jan,20,2022',
                        choice3: 'Oct,22,2021',
                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                      ),
                      ReusableText(
                        TextString: 'Choose The time',
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButton(
                        choice1: '12:03',
                        choice2: '34:56',
                        choice3: '43:16',
                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                      ),
                      GestureDetector(
                        onTap: () {
                          InputDescription(context, categorie);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(top: 350, left: 30, right: 30),
                          height: 40,
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
                    ],
                  ),
                );
              });
        });
  }

  static CommonDropdownButton({
    required String choice1,
    required String choice2,
    required String choice3,
    String? choice4,
    String? choice5,
    String? choice6,
    String? choice7,
    required void Function(String?)? onChanged,
  }) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        // width: 200,
        decoration: BoxDecoration(
            color: ColorCollections.PrimaryColor,
            borderRadius: BorderRadius.circular(7)),
        // margin: EdgeInsets.only(left: 30),
        child: DropdownButtonFormField<String>(
          padding: EdgeInsets.only(left: 15, right: 15),
          isExpanded: true,
          decoration: InputDecoration(border: InputBorder.none),
          focusColor: const Color.fromARGB(255, 237, 236, 236),
          style: TextStyle(color: ColorCollections.Black),
          value: 'None',
          items: [
            DropdownMenuItem<String>(
              value: 'None',
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: 'None',
                FontSize: 16,
              ),
            ),
            DropdownMenuItem<String>(
              value: choice1,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice1,
                FontSize: 16,
              ),
            ),
            DropdownMenuItem<String>(
              value: choice2,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice2,
                FontSize: 16,
              ),
            ),
            DropdownMenuItem<String>(
              value: choice3,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice3,
                FontSize: 16,
              ),
            ),
            if (choice4 != null)
              DropdownMenuItem<String>(
                value: choice4,
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextColor: ColorCollections.Black,
                  TextString: choice4,
                  FontSize: 16,
                ),
              ),
            if (choice5 != null)
              DropdownMenuItem<String>(
                value: choice5,
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextColor: ColorCollections.Black,
                  TextString: choice5,
                  FontSize: 16,
                ),
              ),
            if (choice6 != null)
              DropdownMenuItem<String>(
                value: choice6,
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextColor: ColorCollections.Black,
                  TextString: choice6,
                  FontSize: 16,
                ),
              ),
            if (choice7 != null)
              DropdownMenuItem<String>(
                value: choice7,
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextColor: ColorCollections.Black,
                  TextString: choice7,
                  FontSize: 16,
                ),
              ),
          ],
          onChanged: (String? newValue) => onChanged,
        ));
  }

  static InputDescription(BuildContext context, String categorie) {
    return showBottomSheet(
        backgroundColor: ColorCollections.SecondaryColor,
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  width: double.infinity,
                  color: ColorCollections.SecondaryColor,
                  padding: EdgeInsets.only(left: 15, right: 10, bottom: 15),
                  child: ListView(

                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 20, right: 20, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ChooseLocationButtomSheet(
                                        context, categorie);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: ReusableText(
                                TextString: 'Discription of object ',
                                FontSize: 20,
                                TextFontWeight: FontWeight.bold,
                                TextColor: ColorCollections.Black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      categorie == 'Pets'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  TextString: 'Race',
                                  FontSize: 15,
                                  TextColor: ColorCollections.Black,
                                ),
                                CommonDropdownButton(
                                  choice1: 'Golden Retriever',
                                  choice2: 'Siberian Husky',
                                  choice3: 'Dalmatian',
                                  // ignore: avoid_print
                                  onChanged: (value) => print(value),
                                )
                              ],
                            )
                          : SizedBox(),
                      categorie == 'Electronics'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  TextString: 'Choose brand or model',
                                  FontSize: 15,
                                  TextColor: ColorCollections.Black,
                                ),
                                CommonDropdownButton(
                                  choice1: 'Apple',
                                  choice2: 'Samsung',
                                  choice3: 'Sony',
                                  choice4: '  LG',
                                  choice5: 'Dell',
                                  choice6: 'HP',
                                  choice7: 'Microsoft',
                                  // ignore: avoid_print
                                  onChanged: (value) => print(value),
                                )
                              ],
                            )
                          : SizedBox(),
                      ReusableText(
                        TextString: 'Name of the item',
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButton(
                        choice1: 'Dog',
                        choice2: 'Cat',
                        choice3: 'Hamster',
                        choice4: 'Horse',
                        choice5: 'Rabbit',
                        choice6: 'Mouse',
                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                      ),
                      ReusableText(
                        TextString: 'Color of the item',
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButton(
                        choice1: 'BLACK',
                        choice2: 'BROWN',
                        choice3: 'WHITE',
                        choice4: 'GREEN',
                        choice5: 'ORANGE',
                        choice6: 'GREY',
                        choice7: 'BLUE',

                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                      ),
                      ReusableText(
                        TextString: 'Details',
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      reusableTextField(
                        FromLeft: 15,
                        icon_name: 'item_name',
                        hintText: 'what the item looks like',
                        textType: 'text',
                        onchange: (onchange) {},
                      ),
                      GestureDetector(
                        onTap: () {
                          CustomShowDialoge(context);
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(top: 150, left: 30, right: 30),
                          height: 40,
                          decoration: BoxDecoration(
                            color: ColorCollections.PrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString: 'Submit',
                              FontSize: 20,
                              TextColor: ColorCollections.Black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

//choose photo of your lost

  static CustomBottomSheet(BuildContext context) {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              height: 650,
              color: ColorCollections.SecondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      color: ColorCollections.SecondaryColor,
                      padding: EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: ReusableText(
                        TextString: 'What have you lost/found ?',
                        FontSize: 20,
                        TextColor: ColorCollections.Black,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 200,
                      width: 320,
                      decoration: BoxDecoration(
                        color: ColorCollections.PrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: bottomSheetWidget(
                              'image-gallery',
                              'choose from gallery',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: bottomSheetWidget(
                              'take-a-photo',
                              'Take a photo',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bottomSheetCatagoryPage(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 100, left: 30.w),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorCollections.TeritiaryColor,
                      ),
                      child: Center(
                        child: ReusableText(
                          TextString: 'Next',
                          FontSize: 26,
                          TextColor: ColorCollections.PrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

// main categories container

  static void bottomSheetCatagoryPage(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return ListView(
              children: [
                Container(
                  color: ColorCollections.SecondaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          CustomBottomSheet(context);
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: ColorCollections.SecondaryColor,
                  height: 700,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: CategoriesList.length,
                    itemBuilder: (context, index) {
                      return CommonCatagoryContainer(
                        CategoriesList[index][1]['assets'],
                        CategoriesList[index][1]['txt'],
                        () {
                          CommonSpecificBottomSheetContainer(
                              context, CategoriesList[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

//specific container

  static CommonSpecificBottomSheetContainer(
      BuildContext context, List<Map<String, dynamic>> list) {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              color: ColorCollections.SecondaryColor,
              height: 700,
              child: ListView(
                children: [
                  Container(
                    color: ColorCollections.SecondaryColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            bottomSheetCatagoryPage(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: ColorCollections.SecondaryColor,
                    height: 700,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: list[0]['assets'].length,
                      itemBuilder: (context, index) {
                        String assets = list[0]['assets'][index];
                        String txt = list[0]['txt'][index];
                        return CommonCatagoryContainer(
                          assets,
                          txt,
                          () {
                            MostBottomSheetWidget.ChooseLocationButtomSheet(
                                context, list[0]['item']);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

//categorie items list

//common Catagory container

  static Widget CommonCatagoryContainer(
      String asset, String text, VoidCallback ontap) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorCollections.PrimaryColor,
      ),
      height: 250,
      width: 170,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/categories/$asset.jpeg'),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            height: 100,
            child: Column(
              children: [
                Center(
                  child: ReusableText(
                    FromTop: 12,
                    FromBottom: 10,
                    TextString: '$text',
                    FontSize: 16,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Container(
                    height: 25,
                    width: 60,
                    decoration: BoxDecoration(
                      color: ColorCollections.TeritiaryColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: 'Check',
                        FontSize: 13,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// selecting an image of lost item

  static Widget bottomSheetWidget(String icon, String text) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 15),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              dashPattern: [6, 3], // Length and space of dashes
              color: Colors.black, // Color of the dashed border
              strokeWidth: 2, // Width of the dashed border
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/icons/flat_icons/$icon.png'),
                ),
              ),
            ),
          ),
          ReusableText(
            TextString: '$text',
            FontSize: 14,
            TextColor: ColorCollections.Black,
          ),
        ],
      ),
    );
  }
}
