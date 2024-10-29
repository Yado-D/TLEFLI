import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

Widget partnersContainer(String partnerOne, String partnerTwo) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 170,
            decoration: BoxDecoration(
              border: Border.all(color: ColorCollections.SecondaryColor),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/partners/$partnerOne.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 150,
            width: 170,
            decoration: BoxDecoration(
              border: Border.all(color: ColorCollections.SecondaryColor),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/partners/$partnerTwo.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
