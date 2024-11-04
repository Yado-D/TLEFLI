import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/services/paymentIntegration/paypal/flutter_paypal.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/cash_pay_page.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/newMyObjectPage.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/deliverdUserInfo.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class choosePaymentMethode extends StatefulWidget {
  itemPickedModel item_model;
  choosePaymentMethode({
    super.key,
    required this.item_model,
  });

  @override
  State<choosePaymentMethode> createState() => _choosePaymentMethodeState();
}

class _choosePaymentMethodeState extends State<choosePaymentMethode> {
  bool isInstant = false;

  bool isDelivery = false;

  bool isPaypal = false;

  @override
  Widget build(BuildContext context) {
    UserData? userData = Global.storageServices.getData(AppConstants.USER_DATA);

    return Scaffold(
      appBar: SimpleAppBars(context, 'Payment Method'),
      backgroundColor: ColorCollections.PrimaryColor,
      body: Container(
        margin: EdgeInsets.only(
          top: 50,
          bottom: 100,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorCollections.TeritiaryColor,
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ReusableText(
                  FromLeft: 20,
                  FromBottom: 70,
                  FromTop: 100,
                  TextString: 'Orgainize the restitution',
                  FontSize: 25,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.bold,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isInstant = true;
                        isDelivery = false;
                      });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => paymentDescription(
                            item_model: widget.item_model,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: isInstant
                            ? ColorCollections.TeritiaryColor
                            : ColorCollections.SecondaryColor,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: ColorCollections.TeritiaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                            FromLeft: 15,
                            TextString: 'Pay using credit card or paypal',
                            FontSize: 18,
                            TextColor: isInstant
                                ? ColorCollections.PrimaryColor
                                : ColorCollections.TeritiaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isInstant = false;
                      isDelivery = true;
                    });
                    CustomShowDialogue();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: isDelivery
                          ? ColorCollections.TeritiaryColor
                          : ColorCollections.SecondaryColor,
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: ColorCollections.TeritiaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Pay in cash',
                        FontSize: 18,
                        TextColor: isDelivery
                            ? ColorCollections.PrimaryColor
                            : ColorCollections.TeritiaryColor,
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

  CustomShowDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Center(
              child: ReusableText(
                TextString: 'Confirm You Choose On\n Delivery method',
                FontSize: 20,
                TextColor: ColorCollections.Black,
              ),
            ),

            //  itemName

            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: ColorCollections.TeritiaryColor,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ReusableText(
                        TextString: 'Item Category  :  ',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                      ReusableText(
                        TextString: widget.item_model.main_catagory!,
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ReusableText(
                        TextString: 'Item Name  :  ',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                      ReusableText(
                        TextString: widget.item_model.nested_item!,
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 1,
                    width: 250,
                    color: const Color.fromARGB(255, 79, 79, 77),
                  ),
                  Row(
                    children: [
                      ReusableText(
                        TextString: 'Item fee  :  ',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                      ReusableText(
                        TextString: '3\$',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ReusableText(
                        TextString: 'Delivery fee  :  ',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                      ReusableText(
                        TextString: '5\$',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 1,
                    width: 250,
                    color: const Color.fromARGB(255, 171, 171, 171),
                  ),
                  Row(
                    children: [
                      ReusableText(
                        TextString: 'Total fee  :  ',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                      ReusableText(
                        TextString: '8\$',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => cash_pay_page(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorCollections.TeritiaryColor,
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Confirm',
                        FontSize: 18,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 15),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorCollections.SecondaryColor,
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Cancel',
                        FontSize: 18,
                        TextColor: ColorCollections.Black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
