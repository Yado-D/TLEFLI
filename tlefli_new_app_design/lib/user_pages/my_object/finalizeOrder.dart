import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/services/paymentIntegration/Stripe/stripe_services.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/commons.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class finalizeOrder extends StatefulWidget {
  const finalizeOrder({super.key});

  @override
  State<finalizeOrder> createState() => _finalizeOrderState();
}

class _finalizeOrderState extends State<finalizeOrder> {
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
              StripeServices.instance.makePayment();
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
                  TextString: 'Wallet, Purse €16.00',
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
}
