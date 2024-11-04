import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/home.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class cash_pay_page extends StatefulWidget {
  const cash_pay_page({super.key});

  @override
  State<cash_pay_page> createState() => _cash_pay_pageState();
}

class _cash_pay_pageState extends State<cash_pay_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'User Information'),
      body: ListView(
        children: [
          Center(
            child: ReusableText(
              FromTop: 60,
              TextString: 'no location picked',
              FontSize: 20,
              TextColor: ColorCollections.Black,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorCollections.TeritiaryColor,
                ),
                child: Center(
                  child: ReusableText(
                    TextString: 'Pick location',
                    FontSize: 20,
                    TextColor: ColorCollections.PrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            padding: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border.all(color: ColorCollections.TeritiaryColor),
              borderRadius: BorderRadius.circular(10),
              // color: ColorCollections.TeritiaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 15,
                  FromLeft: 20,
                  TextString: 'Recipient Name',
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                  width: MediaQuery.of(context).size.width,
                  child: reusableTextField(
                    hintText: 'type name',
                    textType: 'textType',
                    onchange: (onchange) {
                      setState(() {
                        // widget.item_model.address = onchange;
                      });
                    },
                  ),
                ),
                ReusableText(
                  FromTop: 15,
                  FromLeft: 20,
                  TextString: 'Phone Number',
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 223, 223, 223)),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  height: 60,
                  width: 370,
                  child: IntlPhoneField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                ),
                ReusableText(
                  FromTop: 15,
                  FromLeft: 20,
                  TextString: 'Recipient Address',
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                  width: MediaQuery.of(context).size.width,
                  child: reusableTextField(
                    hintText: 'type address',
                    textType: 'textType',
                    onchange: (onchange) {
                      setState(() {
                        // widget.item_model.address = onchange;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => home_page(),
                  ),
                  (predicate) => false);
            },
            child: Center(
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorCollections.TeritiaryColor),
                  borderRadius: BorderRadius.circular(10),
                  color: ColorCollections.TeritiaryColor,
                ),
                child: Center(
                  child: ReusableText(
                    TextString: 'Submit',
                    FontSize: 20,
                    TextColor: ColorCollections.PrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
