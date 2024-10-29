import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactSupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(AppLocalizations.of(context)!.contactSupport)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Text(
                          'Contact Us:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.ifYouHaveQuestion,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Email: TLEFLI@example.com',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Phone: +1 (123) 456-7890',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              SizedBox(height: 16),
              Center(
                child: Card(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    width: 350,
                    height: 300,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.supportHours,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.supportHourOne,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          AppLocalizations.of(context)!.supportHourTwo,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          AppLocalizations.of(context)!.supportHourThree,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
