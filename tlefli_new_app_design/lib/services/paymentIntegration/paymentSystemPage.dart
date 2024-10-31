import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/services/paymentIntegration/creditCard.dart';
import 'package:tlefli_new_app_design/services/paymentIntegration/paypal/paypal_payment.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class PaymentSystem extends StatefulWidget {
  const PaymentSystem({super.key});

  @override
  State<PaymentSystem> createState() => _PaymentSystemState();
}

class _PaymentSystemState extends State<PaymentSystem> {
  bool isInstant = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'Choose Methods'),
      body: ListView(
        children: [
          ReusableText(
            FromLeft: 30,
            FromBottom: 0,
            FromTop: 100,
            TextString: 'Choose payment methods',
            FontSize: 20,
            TextColor: ColorCollections.Black,
            TextFontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              chooseMethodsContaner(paymentImages[0], 100, 'paypal'),
              chooseMethodsContaner(paymentImages[1], 100, 'credit_card'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              chooseMethodsContaner(paymentImages[0], 10, 'paypal'),
              chooseMethodsContaner(paymentImages[1], 10, 'credit_card'),
            ],
          ),
        ],
      ),
    );
  }

  Widget chooseMethodsContaner(String image, double top, String method) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            // isInstant = true;
            // isDelivery = false;
          });
          if (method == 'paypal') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaypalPayment(),
              ),
            );
          } else if (method == 'credit_card') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreditCard(),
              ),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(top: top, left: 5, right: 5),
          height: 100,
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
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/logos/$image'),
            ),
          ),
        ),
      ),
    );
  }

  List<String> paymentImages = [
    "paypal.jpg",
    "credit.jpg",
    "paypal.jpg",
    "credit.jpg",
  ];
}
