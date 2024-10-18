import 'package:flutter/material.dart';

class ContactSupportSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Contact Support')),
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
                          'If you have any questions, concerns, or need assistance, feel free to reach out to our support team:',
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
                          'Support Hours:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Monday - Friday: 9:00 AM to 6:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Saturday: 10:00 AM to 4:00 PM',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Sunday: Closed',
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
