import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'Payment Method'),
      backgroundColor: ColorCollections.PrimaryColor,
      body: Column(
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
                        builder: (context) => paymentDescription(),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReusableText(
                          TextString: 'Pay using Credit card',
                          FontSize: 18,
                          TextColor: isInstant
                              ? ColorCollections.PrimaryColor
                              : ColorCollections.TeritiaryColor,
                        ),
                        ReusableText(
                          TextString: 'Methods',
                          FontSize: 17,
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
                      TextString: 'Pay on delivery',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyObjectDetailPage(
                            item_model: widget.item_model,
                          ),
                        ),
                        (route) => false);
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
