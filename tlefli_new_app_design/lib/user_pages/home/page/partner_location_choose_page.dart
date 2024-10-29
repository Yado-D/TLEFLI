import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class partner_location_page_ extends StatelessWidget {
  final String type;
  final Map<String, dynamic> map;
  itemPickedModel item_model;
  partner_location_page_({
    super.key,
    required this.type,
    required this.map,
    required this.item_model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, type),
      backgroundColor: ColorCollections.PrimaryColor,
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            SizedBox(height: 15),
            LocationContainer(map, item_model, context),
          ],
        ),
      ),
    );
  }
}
