import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

Widget common_main_catagory_container(
  String asset,
  String text,
  VoidCallback ontap,
) {
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorCollections.PrimaryColor,
    ),
    height: 250,
    width: 170,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/categories/$asset.jpg'),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 100,
          child: Column(
            children: [
              Center(
                child: ReusableText(
                  FromTop: 12,
                  FromBottom: 10,
                  TextString: '$text',
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                ),
              ),
              GestureDetector(
                onTap: ontap,
                child: Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorCollections.TeritiaryColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: 'Check',
                      FontSize: 13,
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
  );
}

Widget common_nested_catagory_container(
  String asset,
  String text,
  VoidCallback ontap,
) {
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: ColorCollections.PrimaryColor,
    ),
    height: 250,
    width: 170,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/categories/$asset.jpeg'),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 100,
          child: Column(
            children: [
              Center(
                child: ReusableText(
                  FromTop: 12,
                  FromBottom: 10,
                  TextString: '$text',
                  FontSize: 16,
                  TextColor: ColorCollections.Black,
                ),
              ),
              GestureDetector(
                onTap: ontap,
                child: Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ColorCollections.TeritiaryColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Center(
                    child: ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: 'Check',
                      FontSize: 13,
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
  );
}

void commonPartnerLocationClicked(
  BuildContext context,
  String type,
  Map<String, dynamic> map,
  itemPickedModel item_model,
) {
  showBottomSheet(
    context: context,
    builder: (context) {
      return Scaffold(
        body: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Container(
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      ReusableText(
                        FromLeft: 40,
                        TextString: type,
                        FontSize: 20,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  LocationContainer(map, item_model, context),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

LocationContainer(Map<String, dynamic> map, itemPickedModel item_model,
    BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 500,
      child: ListView.builder(
        itemCount: map['assets'].length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              item_model.location_choosed = map['txt'][index];
              print(map['txt'][index]);
              Navigator.pop(context);
            },
            child: Container(
              height: 70,
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.PrimaryColor),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/partners/${map['assets'][index]}.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  ReusableText(
                    FromLeft: 15,
                    TextString: map['txt'][index],
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}

CommonDropdownButton({
  required String choice1,
  required String choice2,
  required String choice3,
  String? choice4,
  String? choice5,
  String? choice6,
  String? choice7,
  required void Function(String?)? onChanged,
}) {
  return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      // width: 200,
      decoration: BoxDecoration(
          color: ColorCollections.PrimaryColor,
          borderRadius: BorderRadius.circular(7)),
      // margin: EdgeInsets.only(left: 30),
      child: DropdownButtonFormField<String>(
        padding: EdgeInsets.only(left: 15, right: 15),
        isExpanded: true,
        decoration: InputDecoration(border: InputBorder.none),
        focusColor: const Color.fromARGB(255, 237, 236, 236),
        style: TextStyle(color: ColorCollections.Black),
        value: 'None',
        items: [
          DropdownMenuItem<String>(
            value: 'None',
            child: ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextColor: ColorCollections.Black,
              TextString: 'None',
              FontSize: 16,
            ),
          ),
          DropdownMenuItem<String>(
            value: choice1,
            child: ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextColor: ColorCollections.Black,
              TextString: choice1,
              FontSize: 16,
            ),
          ),
          DropdownMenuItem<String>(
            value: choice2,
            child: ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextColor: ColorCollections.Black,
              TextString: choice2,
              FontSize: 16,
            ),
          ),
          DropdownMenuItem<String>(
            value: choice3,
            child: ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextColor: ColorCollections.Black,
              TextString: choice3,
              FontSize: 16,
            ),
          ),
          if (choice4 != null)
            DropdownMenuItem<String>(
              value: choice4,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice4,
                FontSize: 16,
              ),
            ),
          if (choice5 != null)
            DropdownMenuItem<String>(
              value: choice5,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice5,
                FontSize: 16,
              ),
            ),
          if (choice6 != null)
            DropdownMenuItem<String>(
              value: choice6,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice6,
                FontSize: 16,
              ),
            ),
          if (choice7 != null)
            DropdownMenuItem<String>(
              value: choice7,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextColor: ColorCollections.Black,
                TextString: choice7,
                FontSize: 16,
              ),
            ),
        ],
        onChanged: (String? newValue) => onChanged,
      ));
}

class CommonDropdownButtons extends StatelessWidget {
  final List<String> items;
  final void Function(String?)? onChanged;

  CommonDropdownButtons({
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 30),
      decoration: BoxDecoration(
        color: Colors.white, // Replace with your actual color
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color.fromARGB(255, 190, 190, 190)),
      ),
      child: DropdownButtonFormField<String>(
        padding: EdgeInsets.only(left: 15, right: 15),
        isExpanded: true,
        decoration: InputDecoration(border: InputBorder.none),
        focusColor: const Color.fromARGB(255, 237, 236, 236),
        style: TextStyle(color: Colors.black), // Replace with your actual color
        value: items.isNotEmpty ? items.first : null,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextColor: Colors.black, // Replace with your actual color
              TextString: item,
              FontSize: 16,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
