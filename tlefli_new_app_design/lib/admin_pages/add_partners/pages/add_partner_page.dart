import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of%20location.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class add_partners_page extends StatefulWidget {
  const add_partners_page({super.key});

  @override
  State<add_partners_page> createState() => _add_partners_pageState();
}

class _add_partners_pageState extends State<add_partners_page> {
  String txt = '';
  String image_path = 'gbsfgs g';
  Map<String, dynamic> type = {};
  List<Color> list_color =
      List.generate(4, (index) => ColorCollections.SecondaryColor);
  void _changeColor(int index) {
    setState(() {
      for (int i = 0; i < 4; i++) {
        if (list_color[i] == ColorCollections.TeritiaryColor) {
          list_color[i] = ColorCollections.SecondaryColor;
        }
      }

      list_color[index] = ColorCollections.TeritiaryColor;
      type = m[index];
    });
  }

  List<Map<String, dynamic>> m = [
    airport,
    transportaion,
    shopping,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'Add Partners'),
      backgroundColor: ColorCollections.SecondaryColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 30,
                  TextString: 'Add the photo of the partner',
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.w500,
                ),
                Center(
                  child: Container(
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCollections.PrimaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        size: 80,
                      ),
                    ),
                  ),
                ),
                ReusableText(
                  FromTop: 30,
                  TextString: 'Add the name of partner',
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.w500,
                ),
                reusableTextField(
                  FromLeft: 15,
                  icon_name: 'item_name',
                  hintText: 'type the name',
                  textType: 'text',
                  onchange: (onchange) {
                    txt = onchange;
                    setState(() {});
                  },
                ),
                ReusableText(
                  FromTop: 30,
                  TextString: 'Type of partner',
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.w500,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => _changeColor(index),
                          child: Container(
                            height: 60,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: list_color[index],
                            ),
                            child: ReusableText(
                              TextString: partner_list[index],
                              FontSize: 18,
                              TextColor: ColorCollections.Black,
                            ),
                          ),
                        );
                      }),
                ),
                GestureDetector(
                  onTap: () {
                    if (type == null || type.isEmpty) {
                      commonSnackBar(context, 'form should not be null');
                      print(type);
                    } else {
                      type['assets'].add(image_path);
                      type['txt'].add(txt);
                      setState(() {});
                      Navigator.pop(context);
                      print(type);
                    }
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorCollections.TeritiaryColor),
                      child: Center(
                        child: ReusableText(
                          TextString: 'Add',
                          FontSize: 25,
                          TextColor: ColorCollections.PrimaryColor,
                          TextFontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<String> partner_list = [
    'Airport',
    'Transportation',
    'Shopping',
  ];
}
