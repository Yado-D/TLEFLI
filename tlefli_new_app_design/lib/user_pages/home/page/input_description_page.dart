import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/partners_pages/partner_darta/partners_data.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class input_description_page extends StatelessWidget {
  final String categorie;
  input_description_page({
    super.key,
    required this.categorie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, ''),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                      Center(
                        child: ReusableText(
                          FromBottom: 20,
                          TextString: 'Discription of object ',
                          FontSize: 20,
                          TextFontWeight: FontWeight.bold,
                          TextColor: ColorCollections.Black,
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
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  partner1.add(
                    partnerRequestModel(
                      status: 'in delicery',
                      image_url:
                          'https://ultra-pet.co.za/wp-content/uploads/2020/08/socialising-800x630.jpg',
                      item_name: 'dog',
                      date: '22/12/2023',
                      description: 'this is my dog',
                    ),
                  );
                  CustomShowDialoge(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 150, left: 30, right: 30),
                  height: 40,
                  width: 300,
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
            ),
          ],
        ),
      ),
    );
  }
}
