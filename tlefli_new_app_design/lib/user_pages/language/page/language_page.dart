import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/l10n/l10n.dart';
import 'package:tlefli_new_app_design/services/providers/local_provider.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class language_page extends StatefulWidget {
  language_page({super.key});

  @override
  State<language_page> createState() => _language_pageState();
}

class _language_pageState extends State<language_page> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: true);
    final locale = provider.locale; // Default to 'en' if null

    return Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        appBar: SimpleAppBars(context, AppLocalizations.of(context)!.language),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 35, right: 15, top: 60),
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: ColorCollections.PrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Locale>(
                  value: locale,
                  items: L10n.all.map((locale) {
                    return DropdownMenuItem<Locale>(
                      value: locale,
                      child: Center(
                        child: ReusableText(
                          TextString: language_items[L10n.all.indexOf(locale)],
                          FontSize: 16,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newLocale) {
                    if (newLocale != null) {
                      provider.setLocale(newLocale);
                      // print(newLocale);
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorCollections.TeritiaryColor,
                  ),
                  child: Center(
                    child: ReusableText(
                      TextString: AppLocalizations.of(context)!.apply,
                      FontSize: 20,
                      TextColor: ColorCollections.PrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  List<String> language_items = [
    'English',
    'Arabic',
    'French',
  ];
}
