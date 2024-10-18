import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/partners_pages/partner_darta/partners_data.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class Partner_request_details extends StatelessWidget {
  final String? image_path;
  final String? race;
  final String? brand;
  final String? color;
  final String? description;
  final String? name;
  final String? date;
  final String? status;
  const Partner_request_details({
    this.image_path,
    this.race,
    this.brand,
    this.description,
    this.name,
    this.color,
    this.date,
    this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCollections.SecondaryColor,
        appBar: SimpleAppBars(context, 'Items Detail'),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image_path == null
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          height: 200,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(
                                    'https://www.thewall360.com/uploadImages/ExtImages/images1/def-638240706028967470.jpg')),
                          ),
                        ),
                      )
                    : Center(
                        child: Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(image_path!),
                            ),
                          ),
                        ),
                      ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ReusableText(
                          TextString: 'name : ',
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 220,
                        decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ReusableText(
                          TextString: name ?? "",
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ReusableText(
                          TextString: 'Brand : ',
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 220,
                        decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ReusableText(
                          TextString: brand ?? "",
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ReusableText(
                          TextString: 'Race : ',
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 220,
                        decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ReusableText(
                          TextString: race ?? "",
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ReusableText(
                          TextString: 'Color : ',
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 220,
                        decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ReusableText(
                          TextString: color ?? "",
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ReusableText(
                          TextString: 'description : ',
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints.loose(
                          Size(220, 200),
                        ),
                        child: Container(
                          color: ColorCollections.PrimaryColor,
                          child: ReusableText(
                            TextString: description ?? "Error on loading text.",
                            FontSize: 20,
                            TextColor: ColorCollections.Black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          partner1_rejected_list.add(
                            partnerRequestModel(
                                status: status!,
                                image_url: image_path!,
                                item_name: name!,
                                date: date!,
                                description: description!),
                          );
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ColorCollections.PrimaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString: 'Rejected',
                              FontSize: 20,
                              TextColor: ColorCollections.Black,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          partner1_accepted_list.add(
                            partnerRequestModel(
                              status: status ?? ' ',
                              image_url: image_path!,
                              item_name: name!,
                              date: date!,
                              description: description!,
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ColorCollections.TeritiaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString: 'Accept',
                              TextColor: ColorCollections.PrimaryColor,
                              FontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
