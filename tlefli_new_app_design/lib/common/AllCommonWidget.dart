//this is for the page that need the shaped container

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tlefli_new_app_design/main.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FullPageContainer extends StatelessWidget {
  const FullPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/logos/bg.jpg'),
        ),
      ),
    );
  }
}

//this is for reusable text

// ignore: must_be_immutable
class ReusableText extends StatelessWidget {
  String TextString;
  Color TextColor;
  double FontSize;
  FontWeight TextFontWeight;
  double FromTop;
  double FromLeft;
  double FromRight;
  double FromBottom;

  ReusableText({
    super.key,
    required this.TextString,
    this.TextColor = ColorCollections.TeritiaryColor,
    required this.FontSize,
    this.TextFontWeight = FontWeight.w500,
    this.FromTop = 5,
    this.FromLeft = 5,
    this.FromRight = 5,
    this.FromBottom = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: FromTop,
        left: FromLeft,
        right: FromRight,
        bottom: FromBottom,
      ),
      child: Text(
        TextString.tr,
        overflow: TextOverflow.fade,
        style: GoogleFonts.quicksand(
          color: TextColor,
          fontSize: FontSize,
          fontWeight: TextFontWeight,
        ),
      ),
    );
  }
}

//this is for button that we use in the app

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String ButtonText;
  double ButtonHeight;
  double ButtonWidth;
  FontWeight ButtonFontWeight;
  double FontSize;
  Color ButtonColor;
  Color ContainerColor;
  AppButton({
    super.key,
    required this.ContainerColor,
    required this.ButtonText,
    this.ButtonColor = ColorCollections.PrimaryColor,
    this.ButtonFontWeight = FontWeight.bold,
    this.ButtonHeight = 30,
    this.ButtonWidth = 70,
    this.FontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ButtonHeight,
      width: ButtonWidth,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: ColorCollections.TeritiaryColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(5, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: ContainerColor.withOpacity(1),
      ),
      child: Center(
        child: Text(
          ButtonText,
          style: TextStyle(
            fontWeight: ButtonFontWeight,
            fontSize: FontSize,
            color: ButtonColor,
          ),
        ),
      ),
    );
  }
}

//reusable text field

Widget reusableTextField({
  required String icon_name,
  String suffix_icon_name = '',
  required String hintText,
  required String textType,
  required void Function(String values)? onchange,
  double WidthOfContainer = 300,
  double widthOfTextField = 150,
  double FromTop = 0,
  double FromBottom = 0,
  double FromRight = 0,
  double FromLeft = 0,
}) {
  return Container(
    height: 50.h,
    width: WidthOfContainer.w,
    margin: EdgeInsets.only(
      top: FromTop.w,
      bottom: FromBottom.w,
      left: FromLeft.w,
      right: FromRight.w,
    ),
    decoration: BoxDecoration(
      color: ColorCollections.PrimaryColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color.fromARGB(255, 192, 190, 190)),
    ),
    child: Row(
      children: [
        Container(
          height: 16.w,
          width: 16.w,
          margin: const EdgeInsets.only(left: 17),
          child: Image.asset("assets/icons/flat_icons/$icon_name.png"),
        ),
        SizedBox(
          height: 50.h,
          width: widthOfTextField.h,
          child: TextField(
            onChanged: (value) => onchange!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            obscureText: textType == "password" ? true : false,
          ),
        ),
        if (!(suffix_icon_name == ''))
          Container(
            height: 16.w,
            width: 16.w,
            margin: const EdgeInsets.only(left: 17),
            child: Image.asset("assets/icons/$suffix_icon_name.png"),
          ),
      ],
    ),
  );
}

AppBar SimpleAppBars(BuildContext context, String title) {
  return AppBar(
    leading: Container(
      margin: EdgeInsets.only(left: 15, bottom: 10),
      child: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pushNamed('/home_page');
          }
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 26,
          color: Colors.blue,
        ),
      ),
    ),
    // iconTheme: IconThemeData(color: ColorCollections.TeritiaryColor),
    backgroundColor: ColorCollections.PrimaryColor,
    automaticallyImplyLeading: false,
    flexibleSpace: Container(
      height: 120,
      padding: EdgeInsets.only(top: 35, left: 10, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: FittedBox(
              child: ReusableText(
                FromLeft: 40,
                TextString: title,
                FontSize: 26,
                TextColor: Colors.blue,
                TextFontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

AppBar ReusableAppBar(VoidCallback ontap, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorCollections.PrimaryColor,
    title: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              height: 35.h,
              width: 35.w,
              child: Image.asset(
                'assets/icons/flat_icons/menu-bar.png',
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(left: 80, right: 10),
              height: 120.h,
              width: 130.w,
              child: Image.asset(
                'assets/logos/tlefli_logo.png',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

CustomShowDialoge(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: ColorCollections.PrimaryColor,
        children: [
          Container(
            height: 500,
            width: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ReusableText(
                    TextString:
                        AppLocalizations.of(context)!.youHaveSuccessfully,
                    FontSize: 20,
                  ),
                ),
                Center(
                  child: ReusableText(
                    TextString: AppLocalizations.of(context)!.submitted,
                    FontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: AppLocalizations.of(context)!.category,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: ReusableText(
                          TextString: AppLocalizations.of(context)!.pets,
                          FontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: AppLocalizations.of(context)!.itemName,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 30,
                      width: 150,
                      decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: ReusableText(
                          TextString: AppLocalizations.of(context)!.cat,
                          FontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: AppLocalizations.of(context)!.description,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.fromViewConstraints(
                          ViewConstraints(maxWidth: 180)),
                      child: Container(
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ReusableText(
                            TextString:
                                'my cat is amzing .he can do anything you say.',
                            FontSize: 16),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 15,
                      TextString: AppLocalizations.of(context)!.photo,
                      FontSize: 15,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          color: ColorCollections.SecondaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(
                        'assets/images/background.jpeg',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/request_page', (route) => false);
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 30, right: 10),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ColorCollections.SecondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString:
                                  AppLocalizations.of(context)!.goToRequest,
                              TextColor: ColorCollections.Black,
                              FontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home_page', (route) => false);
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                            color: ColorCollections.TeritiaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: ReusableText(
                              TextString:
                                  AppLocalizations.of(context)!.goToHome,
                              TextColor: ColorCollections.PrimaryColor,
                              FontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}

Drawer CustomDrowerElement(
    VoidCallback ontap, BuildContext context, Animation<Offset> animation) {
  return Drawer(
    child: Container(
      color: ColorCollections.SecondaryColor,
      padding: EdgeInsets.only(top: 20, left: 20, right: 10, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, bottom: 100),
            child: SlideTransition(
              position: animation,
              child: IconButton(
                onPressed: ontap,
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                DrowerWidget(Icons.shopping_bag_rounded,
                    AppLocalizations.of(context)!.request, () {
                  Navigator.of(context).pushNamed('/request_page');
                }),
                DrowerWidget(Icons.language_outlined,
                    AppLocalizations.of(context)!.language, () {
                  Navigator.of(context).pushNamed('/language_page');
                }),
                DrowerWidget(Icons.info, AppLocalizations.of(context)!.aboutUs,
                    () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/about_us_page', (route) => false);
                }),
                DrowerWidget(
                    Icons.logout_outlined, AppLocalizations.of(context)!.logOut,
                    () {
                  LogoutShowDialogue(context);
                }),
                Container(
                  margin: EdgeInsets.only(top: 180),
                  height: 1,
                  width: 230,
                  color: ColorCollections.Black,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      FromLeft: 25,
                      FromBottom: 0,
                      TextString: 'TEFLI company',
                      FontSize: 14,
                      TextColor: ColorCollections.Black,
                    ),
                    ReusableText(
                      FromTop: 5,
                      TextString: 'Privacy Policy',
                      FontSize: 14,
                      TextColor: const Color.fromARGB(255, 23, 120, 222),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget DrowerWidget(IconData icons, String text, VoidCallback ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              icons,
              size: 35,
            ),
          ),
          ReusableText(
            FromLeft: 15,
            TextString: text,
            FontSize: 20,
            TextColor: ColorCollections.Black,
          ),
        ],
      ),
    ),
  );
}

LogoutShowDialogue(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        ReusableText(
                          TextColor: ColorCollections.Black,
                          TextString: AppLocalizations.of(context)!.logOut,
                          FontSize: 20,
                          TextFontWeight: FontWeight.w700,
                        ),
                        ReusableText(
                          TextColor: ColorCollections.Black,
                          TextString:
                              AppLocalizations.of(context)!.areYouSureLogout,
                          FontSize: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/sign_in_page');
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: ColorCollections.SecondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString:
                                    AppLocalizations.of(context)!.confirm,
                                FontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              color: ColorCollections.TeritiaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: ReusableText(
                                TextString:
                                    AppLocalizations.of(context)!.cancel,
                                FontSize: 18,
                                TextColor: ColorCollections.PrimaryColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      });
}
