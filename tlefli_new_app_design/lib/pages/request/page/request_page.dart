import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
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
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCollections.PrimaryColor),
                  height: 200,
                  width: 130,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/background.jpeg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            ReusableText(
                              TextString: 'pets',
                              FontSize: 16,
                              TextColor: ColorCollections.Black,
                            ),
                            ReusableText(
                              TextString: '23/4/2014',
                              FontSize: 16,
                              TextColor: ColorCollections.Black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.lock_clock_rounded,
                                  color: Colors.green,
                                ),
                                ReusableText(
                                  TextString: 'in deliverty',
                                  FontSize: 16,
                                  TextColor: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
