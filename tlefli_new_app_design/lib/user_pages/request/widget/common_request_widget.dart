import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class common_request_container extends StatelessWidget {
  final String status;
  final String item_name;
  final String date;
  final String image_url;

  const common_request_container({
    super.key,
    required this.status,
    required this.item_name,
    required this.date,
    required this.image_url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorCollections.PrimaryColor),
      height: 200,
      width: 130,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 100,
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image_url), fit: BoxFit.fill),
            ),
          ),
          Container(
            child: Column(
              children: [
                ReusableText(
                  TextString: item_name,
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                ),
                ReusableText(
                  TextString: date,
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_clock_rounded,
                      color: Colors.green,
                    ),
                    ReusableText(
                      TextString: status,
                      FontSize: 16,
                      TextColor: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
