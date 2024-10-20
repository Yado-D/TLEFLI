import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class type_location_page extends StatelessWidget {
  const type_location_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TeritiaryColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 120,
          padding: EdgeInsets.only(top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorCollections.PrimaryColor,
                ),
              ),
              reusableTextField(
                FromBottom: 5,
                WidthOfContainer: 280,
                icon_name: 'item_name',
                hintText: 'type the location',
                textType: 'location',
                onchange: (onchange) {},
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.fromViewConstraints(
              ViewConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width),
            ),
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: const Color.fromARGB(255, 249, 249, 249),
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            FromLeft: 20,
                            TextString: 'TextString',
                            FontSize: 20,
                            TextColor: ColorCollections.Black,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 3),
                            height: 1,
                            color: const Color.fromARGB(255, 179, 179, 178),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
