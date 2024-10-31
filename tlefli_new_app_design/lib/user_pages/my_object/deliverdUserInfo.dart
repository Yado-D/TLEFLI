import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/choiceOfCarrier.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/commons.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class paymentDescription extends StatefulWidget {
  const paymentDescription({super.key});

  @override
  State<paymentDescription> createState() => _paymentDescriptionState();
}

class _paymentDescriptionState extends State<paymentDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: SimpleAppBars(context, 'Payment Descriptions'),
      body: ListView(
        children: [
          paymentDescriptionContainer(
            context,
            true,
            "location.svg",
            'Enter your information',
          ),
          paymentDescriptionContainer(
            context,
            false,
            'delivery.svg',
            'Choice of carrier',
          ),
          paymentDescriptionContainer(
            context,
            false,
            'verified.svg',
            'Finalizing the order',
          ),
          ReusableText(
            FromTop: 20,
            FromLeft: 20,
            TextString: 'Address',
            FontSize: 18,
            TextColor: ColorCollections.Black,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            child: reusableTextField(
              hintText: 'address',
              textType: 'textType',
              onchange: (onchange) {
                setState(() {
                  // widget.item_model.address = onchange;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            child: reusableTextField(
              hintText: 'Postal code',
              textType: 'textType',
              onchange: (onchange) {
                setState(() {
                  // widget.item_model.address = onchange;
                });
              },
            ),
          ),
          Center(
            child: ReusableText(
              FromLeft: 15,
              FromRight: 15,
              FromTop: 15,
              TextString:
                  'Recipient information (Specify the contact information of the person to whom the parcel will be given',
              FontSize: 18,
              TextColor: ColorCollections.Black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            child: reusableTextField(
              hintText: 'address',
              textType: 'textType',
              onchange: (onchange) {
                setState(() {
                  // widget.item_model.address = onchange;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            width: MediaQuery.of(context).size.width,
            child: reusableTextField(
              hintText: 'Postal code',
              textType: 'textType',
              onchange: (onchange) {
                setState(() {
                  // widget.item_model.address = onchange;
                });
              },
            ),
          ),
          Row(
            children: [
              // GestureDetector(
              //   onTap: () =>6️
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
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => chooseCarriers(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: ColorCollections.TeritiaryColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: ColorCollections.SecondaryColor),
              ),
              child: Center(
                child: ReusableText(
                  TextString: 'Next',
                  FontSize: 25,
                  TextColor: ColorCollections.PrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget PhoneNumberCountryCode(
    final List<String> items,
    final void Function(String?)? onChanged,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Colors.white, // Replace with your actual color
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        border: Border.all(color: const Color.fromARGB(255, 190, 190, 190)),
      ),
      child: DropdownButtonFormField<String>(
        // icon: Icon(Icons.arrow_drop_down, color: Colors.red),
        icon: SizedBox.shrink(),
        padding: EdgeInsets.only(left: 0, right: 0),
        isExpanded: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.arrow_drop_down, color: Colors.red),
        ),
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
