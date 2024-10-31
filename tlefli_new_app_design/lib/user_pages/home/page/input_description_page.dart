import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/partners_pages/partner_darta/partners_data.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/list_of_my_object.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tlefli_new_app_design/utils/app_constant.dart';

class input_description_page extends StatefulWidget {
  final String categorie;
  itemPickedModel item_model;
  input_description_page({
    super.key,
    required this.categorie,
    required this.item_model,
  });

  @override
  State<input_description_page> createState() => _input_description_pageState();
}

class _input_description_pageState extends State<input_description_page> {
  UserData? userData;
  bool isFinished = true;
  @override
  void initState() {
    userData = Global.storageServices.getData(AppConstants.USER_DATA);
    if (userData != null) {
      // Use userData properties, e.g.
      print('User First Name: ${userData!.userFname}');
      print('User Last Name: ${userData!.userLname}');
      print('User Last enail: ${userData!.userEmail}');
    } else {
      print('the data is null');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: SimpleAppBars(
        context,
        AppLocalizations.of(context)!.description,
        isDescription: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 5, top: 30),
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
                          TextString: AppLocalizations.of(context)!.description,
                          FontSize: 20,
                          TextFontWeight: FontWeight.bold,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                      widget.item_model.main_catagory == 'Pets'
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
                                  onChanged: (value) {
                                    setState(() {
                                      widget.item_model.bread = value;
                                    });
                                  },
                                ),
                              ],
                            )
                          : SizedBox(),
                      widget.item_model.main_catagory == 'Electronics'
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
                                  onChanged: (value) {
                                    setState(() {
                                      widget.item_model.item_model = value;
                                    });
                                  },
                                ),
                              ],
                            )
                          : SizedBox(),
                      ReusableText(
                        TextString:
                            AppLocalizations.of(context)!.colorOfTheItem,
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      CommonDropdownButtons(
                        items: item_color,
                        // ignore: avoid_print
                        onChanged: (value) {
                          setState(() {
                            widget.item_model.item_color = value;
                          });
                        },
                      ),
                      ReusableText(
                        TextString: AppLocalizations.of(context)!.details,
                        FontSize: 15,
                        TextColor: ColorCollections.Black,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: reusableTextField(
                          // FromLeft: 15,
                          icon_name: 'item_name',
                          hintText: AppLocalizations.of(context)!
                              .whatTheItemLooksLike,
                          textType: 'text',
                          onchange: (onchange) {
                            setState(() {
                              widget.item_model.item_description = onchange;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              child: GestureDetector(
                onTap: () async {
                  if (widget.item_model.item_description == '' &&
                      widget.item_model.item_color == '') {
                    commonSnackBar(context, 'Input fields are required.');
                  } else {
                    setState(() {
                      isFinished = false;
                    });

                    widget.item_model.owner =
                        userData!.userFname + " " + userData!.userLname;

                    String report = await ApiService()
                        .PostLostOrFoundItems(widget.item_model, userData!);
                    if (report == 'posted!') {
                      setState(() {
                        isFinished = true;
                      });
                      CustomShowDialoge(context, widget.item_model);
                      commonSnackBar(context, report);
                    } else {
                      setState(() {
                        isFinished = true;
                      });
                      commonSnackBar(context, report);
                    }
                  }
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 250,
                      left: 53,
                    ),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      color: ColorCollections.TeritiaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: AppLocalizations.of(context)!.submit,
                        FontSize: 20,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (!isFinished)
              ModalBarrier(
                color: const Color.fromARGB(
                    137, 255, 255, 255), // Semi-transparent background
                dismissible: false,
                // Makes it indismisable
              ),
            if (!isFinished)
              Center(
                child: Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
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
