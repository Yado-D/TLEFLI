import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlefli_new_app_design/services/constants.dart';

class StorageServices {
  late final SharedPreferences _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool GetDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPENED_FIRST) ?? false;
  }
}
