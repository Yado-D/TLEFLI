import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:tlefli_new_app_design/services/storage_services.dart';

class Global {
  static late StorageServices storageServices;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageServices = await StorageServices().init();
    // await dotenv.load(fileName: ".env");
    // Stripe.publishableKey =
    //     "pk_test_51Ou8BpSCRynZAJ0mp00QUvtkbRlYkgWclEAcUvuyUhk9OBVJBUEGVyLQOQ34DeaczjzdhY0iX8BUXct22DyGbFR400hhQiyMtd";
  }
}
