import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of_categories.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/nested_categorie_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class choose_main_catagory_page extends StatelessWidget {
  const choose_main_catagory_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, ''),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            color: ColorCollections.SecondaryColor,
            height: 700,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: CategoriesList.length,
              itemBuilder: (context, index) {
                return common_main_catagory_container(
                  CategoriesList[index][1]['assets'],
                  CategoriesList[index][1]['txt'],
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            nested_categorie_page(list: CategoriesList[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
