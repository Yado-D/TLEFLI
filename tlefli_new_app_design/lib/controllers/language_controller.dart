import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlefli_new_app_design/models/language_model.dart';
import 'package:tlefli_new_app_design/utils/app_constant.dart';

class LocalizationController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;
  LocalizationController({required this.sharedPreferences}) {
    loadCurrentLanguage();
  }
  Locale _locale = Locale(
    AppConstant.language[0].languageCode,
    AppConstant.language[0].countryCode,
  );
  Locale get locale => _locale;
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<LanguageModel> _language = [];

  List<LanguageModel> get language => _language;

  void loadCurrentLanguage() async {
    _locale = Locale(
      sharedPreferences.getString(AppConstant.LANGUAGE_CODE) ??
          AppConstant.language[0].languageCode,
      sharedPreferences.getString(AppConstant.COUNTRY_CODE) ??
          AppConstant.language[0].countryCode,
    );
    for (int index = 0; index < AppConstant.language.length; index++) {
      if (AppConstant.language[index].languageCode == _locale.languageCode) {
        _selectedIndex = index;
        break;
      }
    }
    _language = [];
    _language.addAll(AppConstant.language);
    update();
  }
}
