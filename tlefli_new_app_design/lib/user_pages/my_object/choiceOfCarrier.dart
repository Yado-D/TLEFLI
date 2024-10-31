import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/commons.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/finalizeOrder.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class chooseCarriers extends StatefulWidget {
  const chooseCarriers({super.key});

  @override
  State<chooseCarriers> createState() => _chooseCarriersState();
}

class _chooseCarriersState extends State<chooseCarriers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: SimpleAppBars(context, 'Payment Descriptions'),
      body: ListView(
        children: [
          paymentDescriptionContainer(
            context,
            false,
            "location.svg",
            'Enter your information',
          ),
          paymentDescriptionContainer(
            context,
            true,
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
            TextString: 'Select your offer',
            FontSize: 18,
            TextColor: ColorCollections.Black,
          ),
          Container(
            height: 100,
            // width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/truck.png'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableText(
                FromTop: 20,
                FromLeft: 20,
                TextString: 'Delivery',
                FontSize: 18,
                TextColor: ColorCollections.Black,
              ),
              ReusableText(
                // FromTop: 20,
                FromLeft: 20,
                TextString: 'Resident',
                FontSize: 18,
                TextColor: ColorCollections.Black,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 90,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logos/poste_moroc.png'),
                  ),
                ),
              ),
              Container(
                height: 90,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/logos/amana.jpg'),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReusableText(
                FromTop: 20,
                FromLeft: 20,
                TextString: '8\$',
                FontSize: 18,
                TextColor: ColorCollections.Black,
              ),
              ReusableText(
                // FromTop: 20,
                FromLeft: 20,
                TextString: '2 days',
                FontSize: 18,
                TextColor: const Color.fromARGB(255, 120, 120, 120),
              ),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (onChanged) {},
              ),
              ReusableText(
                // FromTop: 20,
                FromLeft: 20,
                TextString:
                    'Do you want your colls with Serenity \nInsurance offered by AXA?',
                FontSize: 18,
                TextColor: ColorCollections.Black,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF003540),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: ColorCollections.SecondaryColor),
              ),
              child: Center(
                child: ReusableText(
                  TextString: 'Previous',
                  FontSize: 25,
                  TextColor: ColorCollections.PrimaryColor,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => finalizeOrder(),
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
}
