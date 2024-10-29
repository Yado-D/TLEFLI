import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_location_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/editDescription.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class nested_categorie_page extends StatelessWidget {
  final List<Map<String, dynamic>> list;
  final Uint8List? pickedImage;
  String page;
  itemPickedModel item_model;
  nested_categorie_page({
    super.key,
    required this.list,
    this.pickedImage,
    required this.item_model,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: SimpleAppBars(context, 'Choose Catagory'),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        color: ColorCollections.PrimaryColor,
        height: 700,
        child: ListView(
          children: [
            Container(
              color: ColorCollections.PrimaryColor,
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
                  return common_nested_catagory_container(
                    assets,
                    txt,
                    () {
                      item_model.nested_item = list[0]['txt'][index];
                      print(item_model.nested_item);
                      if (page == 'modifie') {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditDescription(item_model: item_model)),
                          (route) => false,
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => choose_location_page(
                                    item_model: item_model,
                                    page: 'report',
                                  )),
                        );
                      }
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
