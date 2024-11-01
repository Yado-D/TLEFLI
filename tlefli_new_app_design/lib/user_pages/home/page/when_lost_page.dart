import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/user_pages/home/page/input_description_page.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class lost_when_page extends StatefulWidget {
  itemPickedModel item_model;
  lost_when_page({super.key, required this.item_model});

  @override
  State<lost_when_page> createState() => _lost_when_pageState();
}

class _lost_when_pageState extends State<lost_when_page> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.PrimaryColor,
      appBar:
          SimpleAppBars(context, AppLocalizations.of(context)!.chooseTheTime),
      body: Stack(
        children: [
          Container(
            color: ColorCollections.PrimaryColor,
            padding: EdgeInsets.only(left: 15, right: 10, bottom: 15, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ReusableText(
                          TextString:
                              AppLocalizations.of(context)!.whenDoYouLost,
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ReusableText(
                  TextString: AppLocalizations.of(context)!.chooseTheDate,
                  FontSize: 15,
                  TextColor: ColorCollections.Black,
                ),
                GestureDetector(
                  onTap: () {
                    _selecteDate();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
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
                      TextString: '${widget.item_model.date_picked}' ?? 'Date',
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 174, 174, 174),
                    ),
                  ),
                ),
                ReusableText(
                  TextString: AppLocalizations.of(context)!.chooseTheTime,
                  FontSize: 15,
                  TextColor: ColorCollections.Black,
                ),
                GestureDetector(
                  onTap: () {
                    _selecteTime();
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
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
                      TextString: widget.item_model.time_picked ?? 'Time',
                      FontSize: 16,
                      TextColor: const Color.fromARGB(255, 174, 174, 174),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            child: GestureDetector(
              onTap: () {
                if (widget.item_model.date_picked == '' &&
                    widget.item_model.time_picked == '') {
                  commonSnackBar(context, 'Please fill required Inputs.');
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => input_description_page(
                          categorie: 'Pets', item_model: widget.item_model),
                    ),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 350, left: 30, right: 30),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: ColorCollections.TeritiaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: ReusableText(
                    TextString: AppLocalizations.of(context)!.next,
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
