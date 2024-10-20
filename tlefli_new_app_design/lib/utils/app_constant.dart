import 'package:tlefli_new_app_design/models/language_model.dart';

class AppConstant {
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> language = [
    LanguageModel(
      languageName: 'English',
      languageCode: 'en',
      countryCode: 'US',
    ),
    LanguageModel(
      languageName: 'Arabic',
      languageCode: 'ar',
      countryCode: 'AR',
    )
  ];
}
