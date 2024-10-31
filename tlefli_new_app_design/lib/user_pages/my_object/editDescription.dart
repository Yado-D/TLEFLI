import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_location_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/choose_main_catagory_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/pickImages.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditDescription extends StatefulWidget {
  itemPickedModel item_model;
  EditDescription({super.key, required this.item_model});

  @override
  State<EditDescription> createState() => _EditDescriptionState();
}

class _EditDescriptionState extends State<EditDescription> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Uint8List? pickedImage;
  UserData? userData;
  bool isFinished = true;

  @override
  Widget build(BuildContext context) {
    userData = Global.storageServices.getData(AppConstants.USER_DATA);
    if (userData != null) {
      // Use userData properties, e.g.
      print('User First Name: ${userData!.userFname}');
      print('User Last Name: ${userData!.userLname}');
      print('User Last enail: ${userData!.userEmail}');
    } else {
      print('the data is null');
      print(userData);
    }
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar: SimpleAppBars(context, 'Modify an item'),
      body: Container(
        margin: EdgeInsets.only(top: 15, left: 7, right: 7),
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    widget.item_model.pickedImage is Uint8List
                        ? Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorCollections.TeritiaryColor,
                              image: DecorationImage(
                                  image: MemoryImage(
                                      widget.item_model.pickedImage!),
                                  fit: BoxFit.fill),
                            ),
                          )
                        : Container(
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorCollections.TeritiaryColor,
                              image: DecorationImage(
                                image: NetworkImage(
                                    widget.item_model.pickedImage!),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () async {
                          // update by posting to the api and fetch that image or data

                          pickedImage = await pickedImages(ImageSource.gallery);
                          if (pickedImage != null) {
                            setState(() {
                              widget.item_model.pickedImage = pickedImage;
                            });
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 120),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ColorCollections.PrimaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: ReusableText(
                                  TextString: 'Edit Picture',
                                  FontSize: 16,
                                  TextColor: ColorCollections.Black,
                                ),
                              ),
                              Icon(
                                Icons.edit,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      FromRight: 30,
                      TextString: 'Select type of item',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => choose_main_catagory_page(
                          item_model: widget.item_model,
                          page: 'modifie',
                        ),
                      ),
                    );
                    // print(widget.item_model.location_choosed);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    // width: 200,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 219, 219)),
                    ),
                    // margin: EdgeInsets.only(left: 30),
                    child: ReusableText(
                      FromLeft: 20,
                      FromTop: 15,
                      TextString: widget.item_model.nested_item ??
                          'item type', //widget.item_model.location_choosed ??
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 174, 174, 174),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      FromRight: 30,
                      TextString: 'Choose a Date',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: _selecteDate,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    // width: 200,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 219, 219)),
                    ),
                    // margin: EdgeInsets.only(left: 30),
                    child: ReusableText(
                      FromLeft: 20,
                      FromTop: 15,
                      TextString: widget.item_model.date_picked ??
                          'date', //widget.item_model.location_choosed ??
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 174, 174, 174),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      FromRight: 30,
                      TextString: 'Choose a time',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => type_location_page(
                    //       item_model: widget.item_model,
                    //     ),
                    //   ),
                    // );
                    // print(widget.item_model.location_choosed);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                    // width: 200,
                    decoration: BoxDecoration(
                      color: ColorCollections.PrimaryColor,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 219, 219)),
                    ),
                    // margin: EdgeInsets.only(left: 30),
                    child: ReusableText(
                      FromLeft: 20,
                      FromTop: 15,
                      TextString: widget.item_model.time_picked ??
                          'time', //widget.item_model.location_choosed ??
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 174, 174, 174),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 225, 224),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        FromTop: 15,
                        FromLeft: 30,
                        FromRight: 30,
                        TextString: 'Location',
                        FontSize: 20,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 225, 224),
                    ),
                  ),
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, top: 15),
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 224, 225, 224),
                                    ),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 40,
                                  ),
                                ),
                                ReusableText(
                                  FromLeft: 10,
                                  FromRight: 30,
                                  TextString: 'Address',
                                  FontSize: 15,
                                  TextColor: ColorCollections.Black,
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    TextString:
                                        widget.item_model.city ?? "city",
                                    FontSize: 15,
                                    TextColor: ColorCollections.Black,
                                  ),
                                  ReusableText(
                                    TextString:
                                        widget.item_model.address ?? "address",
                                    FontSize: 11,
                                    TextColor: ColorCollections.Black,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => choose_location_page(
                                item_model: widget.item_model,
                                page: 'modifie',
                              ),
                            ),
                          );
                          setState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color.fromARGB(255, 224, 225, 224),
                            ),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString: 'Edit location',
                              FontSize: 20,
                              TextColor: ColorCollections.Black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 224, 225, 224),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                        FromTop: 15,
                        FromLeft: 30,
                        FromRight: 30,
                        TextString: 'Items Detail',
                        FontSize: 20,
                        TextColor: ColorCollections.Black,
                      ),
                    ],
                  ),
                ),
                widget.item_model.main_catagory == 'Pets'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReusableText(
                                FromLeft: 30,
                                FromRight: 30,
                                TextString: 'Breed',
                                FontSize: 15,
                                TextColor: ColorCollections.Black,
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
                            // width: 200,
                            decoration: BoxDecoration(
                              color: ColorCollections.PrimaryColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 219, 219, 219)),
                            ),
                            child: reusableTextField(
                              hintText: widget.item_model.bread ?? 'breed',
                              textType: 'textType',
                              onchange: (onchange) {
                                setState(() {
                                  widget.item_model.bread = onchange;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                widget.item_model.main_catagory == 'Pets'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReusableText(
                                FromLeft: 30,
                                FromRight: 30,
                                TextString: 'Animal Name',
                                FontSize: 15,
                                TextColor: ColorCollections.Black,
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
                            // width: 200,
                            decoration: BoxDecoration(
                              color: ColorCollections.PrimaryColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 219, 219, 219)),
                            ),
                            // margin: EdgeInsets.only(left: 30),
                            child: reusableTextField(
                              hintText: widget.item_model.nested_item ??
                                  'Animal name',
                              textType: 'textType',
                              onchange: (onchange) {
                                setState(() {
                                  widget.item_model.nested_item = onchange;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                widget.item_model.main_catagory == 'Electronics'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReusableText(
                                FromLeft: 30,
                                FromRight: 30,
                                TextString: 'Brand Name',
                                FontSize: 15,
                                TextColor: ColorCollections.Black,
                              ),
                            ],
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            margin:
                                EdgeInsets.only(left: 20, right: 20, top: 5),
                            // width: 200,
                            decoration: BoxDecoration(
                              color: ColorCollections.PrimaryColor,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 219, 219, 219)),
                            ),
                            // margin: EdgeInsets.only(left: 30),
                            child: reusableTextField(
                              hintText:
                                  widget.item_model.nested_item ?? 'Brand name',
                              textType: 'textType',
                              onchange: (onchange) {
                                setState(() {
                                  widget.item_model.nested_item = onchange;
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      FromRight: 30,
                      TextString: 'Color',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                  // width: 200,
                  decoration: BoxDecoration(
                    color: ColorCollections.PrimaryColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: const Color.fromARGB(255, 219, 219, 219)),
                  ),
                  // margin: EdgeInsets.only(left: 30),
                  child: reusableTextField(
                    hintText:
                        widget.item_model.item_color ?? 'hintcolor of item',
                    textType: 'textType',
                    onchange: (onchange) {
                      setState(() {
                        widget.item_model.item_color = onchange;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 30,
                      FromRight: 30,
                      TextString: 'Details',
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                  // width: 200,
                  decoration: BoxDecoration(
                    color: ColorCollections.PrimaryColor,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: const Color.fromARGB(255, 219, 219, 219)),
                  ),
                  // margin: EdgeInsets.only(left: 30),
                  child: reusableTextField(
                    hintText: widget.item_model.item_description ??
                        'input the discription',
                    textType: 'textType',
                    onchange: (onchange) {
                      setState(() {
                        widget.item_model.item_description = onchange;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString:
                                  'Delete item', //widget.item_model.location_choosed ??
                              FontSize: 20,
                              TextColor:
                                  const Color.fromARGB(255, 255, 253, 253),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isFinished = false;
                          });
                          print(widget.item_model.defoultId);
                          String res =
                              await ApiService().UpdateUserPostedItemsById(
                            widget.item_model,
                            userData!,
                            widget.item_model.defoultId ?? '',
                          );
                          setState(() {
                            isFinished = true;
                          });
                          if (res != '200') {
                            print(res);
                            commonSnackBar(
                                context, 'check your internet connection.');
                          } else {
                            print(res);
                            commonSnackBar(context, 'Successful!.');
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 85, 171, 131),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString:
                                  'Modifie change', //widget.item_model.location_choosed ??
                              FontSize: 20,
                              TextColor:
                                  const Color.fromARGB(255, 255, 253, 253),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!isFinished)
              ModalBarrier(
                color: const Color.fromARGB(
                    137, 255, 255, 255), // Semi-transparent background
                dismissible: false,
                // Makes it indismisable
              ),
            if (!isFinished)
              Center(
                child: Container(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  //date picker
  Future<void> _selecteDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (_picked != null) {
      setState(() {
        widget.item_model.date_picked = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selecteTime() async {
    TimeOfDay? pickTime = await showTimePicker(
      // barrierColor: ColorCollections.TeritiaryColor,
      context: context,
      initialTime: _timeOfDay,
    );
    if (pickTime != null) {
      setState(() {
        widget.item_model.time_picked = pickTime.hour.toString() +
            " : " +
            pickTime.minute.toString().padLeft(2, '0');
      });
    }
  }
}
