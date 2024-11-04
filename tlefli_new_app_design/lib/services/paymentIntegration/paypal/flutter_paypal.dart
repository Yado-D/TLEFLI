import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class PaypalPaymentPage extends StatefulWidget {
  const PaypalPaymentPage({
    Key? key,
    required this.title,
    required this.amount,
    required this.nameOfItem,
    required this.recipientCity,
    required this.recipientPostalCode,
    required this.shipping,
    required this.quantity,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientState,
    required this.countryCode,
    required this.currency,
    required this.payerFirstName,
    required this.payerLastName,
    required this.payerId,
    required this.payerEmail,
  }) : super(key: key);
  final String title;
  final double amount;
  final double shipping;
  final String nameOfItem;
  final int quantity;
  final String recipientName;
  final String recipientPhone;
  final String recipientPostalCode;
  final String recipientState;
  final String recipientCity;
  final String countryCode;
  final String currency;
  final String payerFirstName;
  final String payerLastName;
  final String payerId;
  final String payerEmail;

  @override
  State<PaypalPaymentPage> createState() => _PaypalPaymentPageState();
}

class _PaypalPaymentPageState extends State<PaypalPaymentPage> {
  @override
  Widget build(BuildContext context) {
    final clientId = dotenv.env['CLIENT_ID'];
    final secretKey = dotenv.env['SECRET_KEY'];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => UsePaypal(
                    sandboxMode: true,
                    clientId: clientId!,
                    secretKey: secretKey!,
                    returnURL: "https://samplesite.com/return",
                    cancelURL: "https://samplesite.com/cancel",
                    transactions: [
                      {
                        "amount": {
                          "total": (widget.amount * widget.quantity +
                                  widget.shipping)
                              .toStringAsFixed(2),
                          "currency": widget.currency,
                          "details": {
                            "subtotal": (widget.amount * widget.quantity)
                                .toStringAsFixed(2),
                            "shipping": widget.shipping.toStringAsFixed(2),
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        "item_list": {
                          "items": [
                            {
                              "name": widget.nameOfItem,
                              "quantity": widget.quantity,
                              "price": widget.amount.toStringAsFixed(2),
                              "currency": widget.currency
                            }
                          ],
                          "shipping_address": {
                            "recipient_name": widget.recipientName,
                            "line1": "Travis County",
                            "line2": "",
                            "city": widget.recipientCity,
                            "country_code": widget.countryCode,
                            "postal_code": widget.recipientPostalCode,
                            "phone": widget.recipientPhone,
                            "state": widget.recipientState
                          },
                        },
                        "payer": {
                          "email": widget.payerEmail,
                          "payer_info": {
                            "payer_id": widget.payerId,
                            "first_name": widget.payerFirstName,
                            "last_name": widget.payerLastName,
                          }
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      print("onSuccess: $params");
                    },
                    onError: (error) {
                      print("onError: $error");
                    },
                    onCancel: (params) {
                      print('cancelled: $params');
                    }),
              ),
            )
          },
          child: Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorCollections.TeritiaryColor),
            child: Center(
              child: ReusableText(
                TextString: 'Make Payment',
                FontSize: 18,
                TextColor: ColorCollections.PrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
