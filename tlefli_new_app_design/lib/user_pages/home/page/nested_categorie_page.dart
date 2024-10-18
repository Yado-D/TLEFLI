import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_location_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class nested_categorie_page extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  const nested_categorie_page({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, ''),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        color: ColorCollections.SecondaryColor,
        height: 700,
        child: ListView(
          children: [
            Container(
              color: ColorCollections.SecondaryColor,
              height: 700,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: list[0]['assets'].length,
                itemBuilder: (context, index) {
                  String assets = list[0]['assets'][index];
                  String txt = list[0]['txt'][index];
                  return common_main_catagory_container(
                    assets,
                    txt,
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => choose_location_page()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
