import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/request/widget/common_request_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class request_page extends StatelessWidget {
  const request_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: SimpleAppBars(context, 'Requests'),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  // childAspectRatio: 10 / 16,
                  crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(childCount: 3,
                  (BuildContext context, int index) {
                return common_request_container(
                  item_name: 'pets',
                  image_url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOyAsUMUdpdrpqvp8XGt188HumsBC_f_OadA&s',
                  date: '12/34/1012',
                  status: 'in delivery',
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
