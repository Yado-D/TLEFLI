import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class faq_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'FAQ'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaqItem(
                question: 'How do I create an account?',
                answer: 'To create an account, go to the "Sign Up" page...',
              ),
              FaqItem(
                question: 'Is my personal information secure?',
                answer: 'Yes, we take the security of your data seriously...',
              ),
              FaqItem(
                question: 'What payment methods are accepted?',
                answer: 'We currently accept Visa, MasterCard, and PayPal...',
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
      appBar: SimpleAppBars(context, 'Tutorials'),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'How to Use Feature X:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1. Open the app and navigate to the Home screen.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '2. Tap on the "Feature X" icon.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '3. Follow the on-screen instructions to complete the process.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                )),
              ),
              // Your Tutorials content here

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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Troubleshooting Guide:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'If you encounter any issues with Feature X, follow these steps:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '1. Close and reopen the app.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '2. Check your internet connection.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '3. Contact support if the problem persists.',
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
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Troubleshooting Guide:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'If you encounter any issues with Feature X, follow these steps:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '1. Close and reopen the app.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '2. Check your internet connection.',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '3. Contact support if the problem persists.',
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
        title: Center(child: Text('User Manual')),
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
                          'Welcome to our app! Here is a user manual to help you get started:',
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
