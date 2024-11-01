import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';

class AdminUserMatches extends StatelessWidget {
  const AdminUserMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReusableText(
          TextString: 'Match items',
          FontSize: 20,
        ),
      ),
    );
  }
}
