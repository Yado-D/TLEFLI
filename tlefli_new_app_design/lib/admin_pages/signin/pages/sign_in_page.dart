import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/admin_pages/signin/bloc/signin_bloc.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Adminsign_in_page extends StatefulWidget {
  const Adminsign_in_page({super.key});

  @override
  State<Adminsign_in_page> createState() => _Adminsign_in_pageState();
}

class _Adminsign_in_pageState extends State<Adminsign_in_page> {
  bool isSignIn = true;
  UserData? userData;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        const FullPageContainer(),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.arrow_back),
                            ),
                          ],
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 0.sp),
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/logos/tlefli_logo.png',
                                  ),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 230),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: ReusableText(
                                  TextString: 'Admin Login',
                                  FontSize: 28,
                                  TextColor: ColorCollections.Black,
                                  TextFontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    FromTop: 20,
                                    FromLeft: 45,
                                    TextString:
                                        AppLocalizations.of(context)!.email,
                                    FontSize: 13,
                                    TextColor: ColorCollections.Black,
                                    TextFontWeight: FontWeight.bold,
                                  ),
                                  Center(
                                    child: reusableTextField(
                                      // FromLeft: 20,
                                      icon_name: 'mail',
                                      hintText: AppLocalizations.of(context)!
                                          .typeEmail,
                                      textType: 'email',
                                      onchange: (onchange) {
                                        context
                                            .read<AdminSigninBloc>()
                                            .add(AdminEmailEvent(onchange));
                                      },
                                    ),
                                  ),
                                  ReusableText(
                                    FromTop: 20,
                                    FromLeft: 45,
                                    TextString:
                                        AppLocalizations.of(context)!.password,
                                    FontSize: 13,
                                    TextColor: ColorCollections.Black,
                                    TextFontWeight: FontWeight.bold,
                                  ),
                                  Center(
                                    child: reusableTextField(
                                      // FromLeft: 20,
                                      icon_name: 'lock',
                                      hintText: AppLocalizations.of(context)!
                                          .typePassword,
                                      textType: 'password',
                                      onchange: (onchange) {
                                        context
                                            .read<AdminSigninBloc>()
                                            .add(AdminPasswordEvent(onchange));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/forgot_password_page');
                                    },
                                    child: ReusableText(
                                      FromTop: 20,
                                      FromRight: 25,
                                      TextString: AppLocalizations.of(context)!
                                          .forgotPassword,
                                      FontSize: 16,
                                      TextColor: ColorCollections.Black,
                                      TextFontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              BlocConsumer<AdminSigninBloc, AdminSigninState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        isSignIn = false;
                                      });
                                      String response =
                                          await ApiService().checkStatus();
                                      print(response);
                                      String res =
                                          await ApiService().AdminHomePage(
                                        state.email,
                                        state.password,
                                      );
                                      if (res == "Authenticated") {
                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                '/admin_home_page',
                                                (route) => false);
                                      } else {
                                        commonSnackBar(context, res);
                                      }
                                      setState(() {
                                        isSignIn = true;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 90),
                                      height: 45.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                        color: ColorCollections.TeritiaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: ReusableText(
                                          TextString:
                                              AppLocalizations.of(context)!
                                                  .login,
                                          FontSize: 25,
                                          TextColor:
                                              ColorCollections.PrimaryColor,
                                          TextFontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            isSignIn == false
                ? Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white), // Make sure it's white
                          backgroundColor:
                              Colors.grey[700], // Contrast color if needed
                        ),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
