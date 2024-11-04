import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/services/paymentIntegration/Stripe/stripe_services.dart';
import 'package:tlefli_new_app_design/services/paymentIntegration/paypal/flutter_paypal.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/commons.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class finalizeOrder extends StatefulWidget {
  itemPickedModel item_model;

  finalizeOrder({
    super.key,
    required this.item_model,
  });

  @override
  State<finalizeOrder> createState() => _finalizeOrderState();
}

class _finalizeOrderState extends State<finalizeOrder> {
  UserData? userData = Global.storageServices.getData(AppConstants.USER_DATA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: SimpleAppBars(context, 'Payment Descriptions'),
      body: ListView(
        children: [
          paymentDescriptionContainer(
            context,
            false,
            'location.svg',
            'Enter your information',
          ),
          paymentDescriptionContainer(
            context,
            true,
            'delivery.svg',
            'Choice of carrier',
          ),
          paymentDescriptionContainer(
            context,
            false,
            'verified.svg',
            'Finalizing the order',
          ),
          Center(
            child: ReusableText(
              FromTop: 20,
              FromLeft: 20,
              TextString: 'Pay €16.00',
              FontSize: 18,
              TextColor: ColorCollections.Black,
            ),
          ),
          //THE STRIPE INTEGRATION HERE
          GestureDetector(
            onTap: () {
              choose_services();
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF003540),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: ColorCollections.SecondaryColor),
              ),
              child: Center(
                child: ReusableText(
                  TextString: 'Pay 16.00\$',
                  FontSize: 20,
                  TextColor: ColorCollections.PrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  choose_services() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    StripeServices.instance.makePayment();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 45,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorCollections.TeritiaryColor,
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Credit Card Payment',
                        FontSize: 20,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaypalPaymentPage(
                        title: 'Paypal',
                        amount: 3,
                        nameOfItem: widget.item_model.main_catagory! +
                            " " +
                            widget.item_model.nested_item!,
                        recipientCity: 'Rabat',
                        recipientPostalCode: '1234',
                        shipping: 5,
                        quantity: 2,
                        recipientName: 'Marouane',
                        recipientPhone: '0993157092',
                        recipientState: 'Moroco',
                        countryCode: 'US',
                        currency: 'USD',
                        payerEmail: userData!.userEmail,
                        payerFirstName: userData!.userFname,
                        payerLastName: userData!.userLname,
                        payerId: userData!.userPassword,
                      ),
                    ),
                  ),
                  child: Container(
                    height: 45,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorCollections.TeritiaryColor,
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Paypal Payment',
                        FontSize: 20,
                        TextColor: ColorCollections.PrimaryColor,
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
