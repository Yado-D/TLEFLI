import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en'); // Default locale

  Locale get locale => _locale;

  void setLocale(Locale local) {
    if (!L10n.all.contains(locale)) return;
    _locale = local;
    print(local);
    notifyListeners();
  }

  void clearLocale() {
    _locale = Locale('en'); // Reset to default locale
    notifyListeners();
  }
}
