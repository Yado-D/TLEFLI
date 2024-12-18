import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tlefli_new_app_design/services/global.dart';

class StripeServices {
  StripeServices._();
  static final StripeServices instance = StripeServices._();

  Future<void> makePayment() async {
    try {
      String? paymentIntentClientSecret = await _createPaymentIntent(10, 'USD');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Mrouane"),
      );
      await _processPayment();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      await Stripe.instance.confirmPaymentSheetPayment();
    } catch (e) {
      print(e);
    }
  }

  Future<String> _createPaymentIntent(int amount, String currency) async {
    // final stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY'];
    // final stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY'];
    print(
        '${Global.stripeSecretKey}++++++++++++++++++++++++++++++++++++++++++++');
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };
      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          "Authorization": "Bearer ${Global.stripeSecretKey}",
          "Content-Type": "applications/x-www-form-urlencoded",
        }),
      );

      if (response.data != null) {
        print(response.data);
        return response.data['client_secret'];
      }
      print(response.data);

      return 'error';
    } catch (e) {
      return e.toString();
    }
  }

  String _calculateAmount(int amount) {
    final calulateAmount = amount * 100;
    return calulateAmount.toString();
  }
}
