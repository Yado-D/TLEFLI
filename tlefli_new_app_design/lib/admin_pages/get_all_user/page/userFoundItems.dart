import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';

class AdmainUserFoundItems extends StatelessWidget {
  const AdmainUserFoundItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableText(
          TextString: 'Found items',
          FontSize: 20,
        ),
      ),
    );
  }
}
