import 'package:flutter/material.dart';

Widget partnersContainer(String partnerOne, String partnerTwo) {
  return Row(
    children: [
      Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/partners/$partnerOne.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 20),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/images/partners/$partnerTwo.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ],
  );
}
