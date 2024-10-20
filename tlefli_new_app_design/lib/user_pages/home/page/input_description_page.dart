import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/partners_pages/partner_darta/partners_data.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      appBar: SimpleAppBars(
        context,
        AppLocalizations.of(context)!.description,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 5, right: 20, top: 30),
        child: ListView(
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
                          TextString: AppLocalizations.of(context)!.description,
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
                                  TextString:
                                      AppLocalizations.of(context)!.race,
                                  FontSize: 15,
                                  TextColor: ColorCollections.Black,
                                ),
                                CommonDropdownButtons(
                                  items: race,
                                  // ignore: avoid_print
                                  onChanged: (value) => print(value),
                                ),
                              ],
                            )
                          : SizedBox(),
                      categorie == 'Electronics'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReusableText(
                                  TextString: AppLocalizations.of(context)!
                                      .chooseBrandOrModel,
                                  FontSize: 15,
                                  TextColor: ColorCollections.Black,
                                ),
                                CommonDropdownButtons(
                                  items: electronics,
                                  // ignore: avoid_print
                                  onChanged: (value) => print(value),
                                ),
                              ],
                            )
                          : SizedBox(),
                      ReusableText(
                        TextString: AppLocalizations.of(context)!.nameOfTheItem,
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButtons(
                        items: item_name,
                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                      ),
                      ReusableText(
                        TextString:
                            AppLocalizations.of(context)!.colorOfTheItem,
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButtons(
                        items: item_color,
                        // ignore: avoid_print
                        onChanged: (value) => print(value),
                      ),
                      ReusableText(
                        TextString: AppLocalizations.of(context)!.details,
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      reusableTextField(
                        FromLeft: 15,
                        icon_name: 'item_name',
                        hintText:
                            AppLocalizations.of(context)!.whatTheItemLooksLike,
                        textType: 'text',
                        onchange: (onchange) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  bottom: 20,
                  left: 10,
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
                          TextString: AppLocalizations.of(context)!.submit,
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<String> race = [
    'Golden Retriever',
    'Siberian Husky',
    'Dalmatian',
  ];
  List<String> electronics = [
    'Apple',
    'Samsung',
    'Sony',
    'LG',
    'Dell',
    'HP',
    'Microsoft',
  ];
  List<String> item_name = [
    'Dog',
    'Cat',
    'Hamster',
    'Horse',
    'Rabbit',
    'HP',
    'Mouse',
  ];
  List<String> item_color = [
    'BLACK',
    'BROWN',
    'WHITE',
    'GREEN',
    'ORANGE',
    'GREY',
    'BLUE',
  ];
}
