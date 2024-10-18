import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class remove_partners_page extends StatelessWidget {
  const remove_partners_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        appBar: SimpleAppBars(context, 'Remove Partners'),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    TextString: 'Shopping partner',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(left: 5, right: 15),
                    height: 80,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/background.jpeg'),
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 70),
                          child: Center(
                            child: ReusableText(
                              TextColor: ColorCollections.Black,
                              TextString: 'ASAT',
                              FontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(left: 5, right: 15),
                    height: 80,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 60,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/background.jpeg'),
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 70),
                          child: Center(
                            child: ReusableText(
                              TextColor: ColorCollections.Black,
                              TextString: 'ASAT',
                              FontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_forever),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
