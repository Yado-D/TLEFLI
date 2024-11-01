import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common_category_model/widgets/map_of_categories.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/nested_categorie_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class choose_main_catagory_page extends StatelessWidget {
  String page;
  itemPickedModel item_model;
  choose_main_catagory_page({
    super.key,
    required this.item_model,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar:
          SimpleAppBars(context, AppLocalizations.of(context)!.chooseCategory),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            color: ColorCollections.PrimaryColor,
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
                  () async {
                    item_model.main_catagory = CategoriesList[index][1]['txt'];
                    print(item_model.main_catagory);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => nested_categorie_page(
                          page: page,
                          item_model: item_model,
                          list: CategoriesList[index],
                          pickedImage: item_model.pickedImage is Uint8List
                              ? item_model.pickedImage as Uint8List
                              : Uint8List(0),
                        ),
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
