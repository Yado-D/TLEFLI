import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tlefli_new_app_design/services/storage_services.dart';

class Global {
  static late StorageServices storageServices;
  static late String stripeSecretKey;
  static late String stripePublishableKey;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageServices = await StorageServices().init();
    await dotenv.load(fileName: ".env");

    stripePublishableKey = await dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
    stripeSecretKey = await dotenv.env['STRIPE_SECRET_KEY']!;

    Stripe.publishableKey = stripePublishableKey;
  }
}
