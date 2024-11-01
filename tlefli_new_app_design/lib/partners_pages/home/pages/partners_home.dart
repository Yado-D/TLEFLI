import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/partners_pages/common_p/partner_common_widgets.dart';
import 'package:tlefli_new_app_design/partners_pages/home/pages/Partner_request_details.dart';
import 'package:tlefli_new_app_design/partners_pages/partner_darta/partners_data.dart';
import 'package:tlefli_new_app_design/user_pages/request/widget/common_request_widget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class partners_home extends StatefulWidget {
  const partners_home({super.key});

  @override
  State<partners_home> createState() => _partners_homeState();
}

class _partners_homeState extends State<partners_home> {
  @override
  Widget build(BuildContext context) {
    Future<void> _refreshItems() async {
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      setState(() {});
    }

    GlobalKey<ScaffoldState> globalKey = GlobalKey();
    return Scaffold(
      key: globalKey,
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: PartnerReusableAppBar(() {
        globalKey.currentState!.openDrawer();
      }, context, 'Partner Home'),
      drawer: partnersDrawer(context),
      body: RefreshIndicator(
        onRefresh: _refreshItems,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                children: [
                  ReusableText(
                    TextString: 'Welcome Back',
                    FontSize: 20,
                    TextFontWeight: FontWeight.w900,
                    TextColor: ColorCollections.Black,
                  ),
                  ReusableText(
                    TextString: 'Partners',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                    TextFontWeight: FontWeight.w800,
                  )
                ],
              ),
            ),
            Container(
              child: Center(
                child: ReusableText(
                  FromTop: 12,
                  TextString: 'User Request',
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                  TextFontWeight: FontWeight.w900,
                ),
              ),
            ),
            partner1.isNotEmpty
                ? Container(
                    color: ColorCollections.SecondaryColor,
                    height: 700,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: partner1.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Partner_request_details(
                                  name: partner1[index].item_name,
                                  description: partner1[index].description,
                                  image_path: partner1[index].image_url,
                                  date: partner1[index].date,
                                  brand: partner1[index].brand,
                                  race: partner1[index].race,
                                  status: partner1[index].status,
                                ),
                              ),
                            );
                          },
                          child: common_request_container(
                            date: partner1[index].date,
                            status: partner1[index].status,
                            item_name: partner1[index].item_name,
                            image_url: partner1[index].image_url,
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: ReusableText(
                      FromTop: 250,
                      TextString: 'No request\'s enjoy the day!',
                      FontSize: 25,
                      TextColor: const Color.fromARGB(255, 86, 86, 86),
                      TextFontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
