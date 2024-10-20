import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class forgot_password_page extends StatelessWidget {
  const forgot_password_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  FullPageContainer(),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 0.sp),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/logos/tlefli_app.jpg',
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 250),
                      child: Column(
                        children: [
                          ReusableText(
                            TextString:
                                AppLocalizations.of(context)!.forgotPassword,
                            FontSize: 20,
                          ),
                          reusableTextField(
                            FromTop: 50,
                            icon_name: 'mail',
                            hintText: AppLocalizations.of(context)!.typeEmail,
                            textType: 'email',
                            onchange: (onchange) {},
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(top: 100),
                              height: 45.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: ColorCollections.TeritiaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: ReusableText(
                                  TextString:
                                      AppLocalizations.of(context)!.submit,
                                  FontSize: 25,
                                  TextColor: ColorCollections.PrimaryColor,
                                  TextFontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
