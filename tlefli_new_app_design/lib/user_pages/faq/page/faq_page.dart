import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class faq_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, AppLocalizations.of(context)!.faq),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaqItem(
                question: AppLocalizations.of(context)!.howDoICreate,
                answer: AppLocalizations.of(context)!.toCreateAnswer,
              ),
              FaqItem(
                question:
                    AppLocalizations.of(context)!.isMyPersonalInformationSecure,
                answer: AppLocalizations.of(context)!.yesWeTakeTheSecurity,
              ),
              FaqItem(
                question:
                    AppLocalizations.of(context)!.whatPaymentMethodsAreAccepted,
                answer: AppLocalizations.of(context)!.weCurrentlyAcceptVisa,
              ),
              // Add more FAQ items as needed
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorCollections.PrimaryColor,
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: ColorCollections.Black, // Customize the text color
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              answer,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blue, // Customize the text color
              ),
            ),
          ),
        ],
        tilePadding: EdgeInsets.all(16.0), // Adjust tile padding as needed
        collapsedTextColor: Colors.blue, // Customize collapsed text color
        iconColor: Colors.blue, // Customize the icon color
        backgroundColor: Colors.grey[200], // Customize background color
      ),
    );
  }
}

class TutorialsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, AppLocalizations.of(context)!.tutorials),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppLocalizations.of(context)!.troubleshootingGuide,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.issuesFollowTheseSteps,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          AppLocalizations.of(context)!.closeAndReopenTheApp,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .checkYourInternetConnection,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .contactSupportIfTheProblemPersists,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class TroubleshootingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Troubleshooting Tips'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your troubleshooting tips content here
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
                              'Common Issues and Solutions:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '1. App Not Loading:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   - Ensure you have a stable internet connection.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '   - Close and reopen the app.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '2. Error Messages:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '   - Note down the error message and contact support.',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '   - Check the app\'s FAQ section for possible solutions.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
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
                              'Contact Support:',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'If you are unable to resolve the issue, please contact our support team:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Email: support@example.com',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Phone: +1 (123) 456-7890',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserManualSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.userManual)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your User Manual content here
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
                          'User Manual:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.userManualDescripton,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              // Add more content as needed
            ],
          ),
        ),
      ),
    );
  }
}
