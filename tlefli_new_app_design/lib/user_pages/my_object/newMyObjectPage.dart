import 'dart:typed_data';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stepper/flutter_stepper.dart';
import 'package:im_stepper/stepper.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/choosePaymentMethode.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/editDescription.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:enhance_stepper/enhance_stepper.dart';

class MyObjectDetailPage extends StatefulWidget {
  itemPickedModel item_model;
  MyObjectDetailPage({super.key, required this.item_model});

  @override
  State<MyObjectDetailPage> createState() => _MyObjectPageState();
}

class _MyObjectPageState extends State<MyObjectDetailPage> {
  int currentStep = 0;
  void _currentStep() {
    setState(() {
      currentStep + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, widget.item_model.nested_item ?? ''),
      backgroundColor: ColorCollections.PrimaryColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            height: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 248, 248, 248),
            ),
            child: Column(
              children: [
                widget.item_model.pickedImage is Uint8List
                    ? Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: MemoryImage(widget.item_model.pickedImage!),
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.item_model.pickedImage!),
                          ),
                        ),
                      ),
                ReusableText(
                  FromTop: 10,
                  TextString: widget.item_model.nested_item ?? "",
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                ),
                ReusableText(
                  FromTop: 10,
                  TextString: widget.item_model.date_picked ?? "",
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                ),
                ReusableText(
                  FromTop: 10,
                  TextString: widget.item_model.city ?? "",
                  FontSize: 18,
                  TextColor: ColorCollections.Black,
                ),
                GestureDetector(
                  onTap: () => showBottomSheet(context),
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 50,
                    width: 170,
                    decoration: BoxDecoration(
                      color: ColorCollections.TeritiaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Quick overview',
                        FontSize: 20,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            child: Stepper(
              currentStep: currentStep,
              onStepTapped: (value) => setState(() => currentStep = value),
              steps: [
                Step(
                  isActive: currentStep == 0 ? true : false,
                  title: ReusableText(
                    FromTop: 10,
                    TextString: 'Item Added',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  content: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EditDescription(item_model: widget.item_model),
                        ),
                      );
                    },
                    child: Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorCollections.TeritiaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: ReusableText(
                          FromTop: 0,
                          TextString: 'Edit Description',
                          FontSize: 18,
                          TextColor: ColorCollections.PrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Step(
                  isActive: currentStep == 1 ? true : false,
                  title: ReusableText(
                    FromTop: 10,
                    TextString: 'Match Found',
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  content: ReusableText(
                    FromTop: 10,
                    TextString: widget.item_model.city ?? "",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                Step(
                  isActive: currentStep == 2 ? true : false,
                  title: ReusableText(
                    FromTop: 10,
                    TextString: "Authentication in progress",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  content: ReusableText(
                    FromTop: 10,
                    TextString: widget.item_model.city ?? "",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                Step(
                  isActive: currentStep == 3 ? true : false,
                  title: ReusableText(
                    FromTop: 10,
                    TextString: "Authentication Validated",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  content: ReusableText(
                    FromTop: 10,
                    TextString: widget.item_model.city ?? "",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                ),
                Step(
                  isActive: currentStep == 4 ? true : false,
                  title: ReusableText(
                    FromTop: 10,
                    TextString: "Restitiution in Progress",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  content: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => choosePaymentMethode(
                            item_model: widget.item_model,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorCollections.TeritiaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: ReusableText(
                          FromTop: 0,
                          TextString: 'Check Payment',
                          FontSize: 18,
                          TextColor: ColorCollections.PrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Step(
                  isActive: currentStep == 5 ? true : false,
                  title: ReusableText(
                    FromTop: 10,
                    TextString: "Returned item",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                  content: ReusableText(
                    FromTop: 10,
                    TextString: widget.item_model.city ?? "",
                    FontSize: 18,
                    TextColor: ColorCollections.Black,
                  ),
                )
              ],
              controlsBuilder: (BuildContext, ControlsDetails) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 900,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        TextString: widget.item_model.nested_item ?? "",
                        FontSize: 20,
                        TextColor: ColorCollections.Black,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_right,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorCollections.TeritiaryColor,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(widget.item_model.pickedImage!),
                        ),
                      ),
                    ),
                  ),
                  showLostItem('Type:', widget.item_model.nested_item ?? ""),
                  showLostItem('Agent\'s name:', widget.item_model.owner ?? ""),
                  showLostItem('Date of loss or find:',
                      widget.item_model.date_picked ?? ""),
                  showLostItem(
                      'Declaration date:', widget.item_model.nested_item ?? ""),
                  showLostItem('Address:', widget.item_model.address ?? ""),
                  showLostItem('City:', widget.item_model.city ?? ""),
                  showLostItem('Country:', widget.item_model.city ?? ""),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget showLostItem(String title, String item_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableText(
          FromTop: 10,
          TextString: title,
          FontSize: 18,
          TextColor: ColorCollections.Black,
        ),
        ReusableText(
          TextString: item_name,
          FontSize: 16,
          TextColor: ColorCollections.Black,
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            height: 0.3,
            width: MediaQuery.of(context).size.width,
            color: ColorCollections.Black,
          ),
        ),
      ],
    );
  }
}
