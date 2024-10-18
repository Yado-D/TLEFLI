import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/Bottomsheets/pages/bottom_sheet.dart';
import 'package:tlefli_new_app_design/Bottomsheets/widgets/map_of_categories.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/partners_pages/partner_darta/partners_data.dart';
import 'package:tlefli_new_app_design/user_pages/request/widget/common_request_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class rejected_items_page extends StatefulWidget {
  const rejected_items_page({super.key});

  @override
  State<rejected_items_page> createState() => _rejected_items_pageState();
}

class _rejected_items_pageState extends State<rejected_items_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'Rejected Items'),
      body: ListView(
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
              itemCount: partner1_rejected_list.length,
              itemBuilder: (context, index) {
                final List<partnerRequestModel> list = partner1_rejected_list;
                return GestureDetector(
                  onTap: () {
                    showDialogue_widget(context, index);
                  },
                  child: common_request_container(
                    status: list[index].status,
                    item_name: list[index].item_name,
                    date: list[index].date,
                    image_url: list[index].image_url,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showDialogue_widget(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                height: 220,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      TextString: 'Are you sure you want to delete this item ?',
                      FontSize: 20,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              partner1_rejected_list
                                  .remove(partner1_rejected_list[index]);
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: ColorCollections.SecondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: ReusableText(
                                  TextString: 'Confirm',
                                  FontSize: 20,
                                  TextColor: ColorCollections.Black,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: ColorCollections.TeritiaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: ReusableText(
                                  TextString: 'Cancel',
                                  FontSize: 20,
                                  TextColor: ColorCollections.PrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
