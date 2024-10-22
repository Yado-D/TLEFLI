import 'package:flutter/cupertino.dart';
import 'package:tlefli_new_app_design/services/storage_services.dart';

class Global {
  static late StorageServices storageServices;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    storageServices = await StorageServices().init();
  }
}
