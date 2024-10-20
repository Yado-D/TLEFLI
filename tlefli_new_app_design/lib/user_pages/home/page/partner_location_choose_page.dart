import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class partner_location_page_ extends StatelessWidget {
  final String type;
  final Map<String, dynamic> map;
  const partner_location_page_({
    super.key,
    required this.type,
    required this.map,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, type),
      backgroundColor: ColorCollections.SecondaryColor,
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            SizedBox(height: 15),
            LocationContainer(
              () {
                Navigator.pop(context);
              },
              map,
            ),
          ],
        ),
      ),
    );
  }
}
