import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


commonSnackBar(BuildContext context, String TextString) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border.all(width: 2.0, color: ColorCollections.TeritiaryColor),
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: ColorCollections.TeritiaryColor)
          ], // Add a blur effect
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              TextString: TextString,
              FontSize: 16,
              TextColor: const Color.fromARGB(255, 112, 114, 112),
              TextFontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 1000,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 6),
    ),
  );
}
