import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class PaypalPayment extends StatelessWidget {
  const PaypalPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AWZvsxu3RpPa09QmaDGQESzokzS-XktU4Dk7nLMkjsea488GSTknltiwGQ7KGL9ykXGnGkMhh6gc5DU1",
        secretKey:
            "EGcIdWU0TRYOi2Hmla4CocPHmPJEW-fUJLeig9xpnD3prRYmaoD-sJBc3okvnXGSAlYkCno2UloElifZ",
        transactions: [
          {
            "amount": {
              "total": 100,
              "currency": "USD",
              "details": {
                "subtotal": '100',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            "payment_options": {
              "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
            },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '10',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '12',
                  "currency": "USD"
                }
              ],
              "shipping_address": {
                "recipient_name": "Tharwat samy",
                "line1": "tharwat",
                "line2": "",
                "city": "tharwat",
                "country_code": "EG",
                "postal_code": "25025",
                "phone": "+00000000",
                "state": "ALex"
              },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    );
  }
}
