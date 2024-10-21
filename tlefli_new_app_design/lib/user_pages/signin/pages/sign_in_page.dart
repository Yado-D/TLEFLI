import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tlefli_new_app_design/auth/signinAuth/signin_auth.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/user_pages/signin/bloc/signin_bloc.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class sign_in_page extends StatelessWidget {
  const sign_in_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const FullPageContainer(),
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
                              TextString: AppLocalizations.of(context)!.login,
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
                                TextString: AppLocalizations.of(context)!.email,
                                FontSize: 13,
                                TextColor: ColorCollections.Black,
                                TextFontWeight: FontWeight.bold,
                              ),
                              Center(
                                child: reusableTextField(
                                  // FromLeft: 20,
                                  icon_name: 'mail',
                                  hintText:
                                      AppLocalizations.of(context)!.typeEmail,
                                  textType: 'email',
                                  onchange: (onchange) {
                                    context
                                        .read<SigninBloc>()
                                        .add(EmailEvent(onchange));
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
                                        .read<SigninBloc>()
                                        .add(PasswordEvent(onchange));
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
                          BlocConsumer<SigninBloc, SigninState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () async {
                                  String res =
                                      await SigninAuth.SigninAuthentication(
                                          context: context,
                                          email: state.email,
                                          password: state.password);
                                  if (res == "welcome back my friend") {
                                    // commonSnackBar(context,
                                    //     'Welcome to TLEFLI! 🎉 Where your lost treasures reunite with you.\n Let\'s make some happy endings happen together!');
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/home_page', (route) => false);
                                  } else {
                                    commonSnackBar(context, res);
                                  }
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
                                          AppLocalizations.of(context)!.login,
                                      FontSize: 25,
                                      TextColor: ColorCollections.PrimaryColor,
                                      TextFontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableText(
                                  TextString: AppLocalizations.of(context)!
                                      .dontHaveAccount,
                                  FontSize: 15,
                                  TextColor:
                                      const Color.fromARGB(255, 147, 150, 147),
                                  TextFontWeight: FontWeight.w500,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/sign_up_page');
                                  },
                                  child: ReusableText(
                                    TextString:
                                        AppLocalizations.of(context)!.signup,
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w900,
                                    TextColor: ColorCollections.Black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 15, bottom: 20),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       GestureDetector(
                          //         onTap: () {
                          //           Navigator.of(context)
                          //               .pushNamed('/partner_home');
                          //         },
                          //         child: Container(
                          //           margin:
                          //               EdgeInsets.only(left: 20, right: 10),
                          //           height: 40,
                          //           width: 150,
                          //           decoration: BoxDecoration(
                          //               color: ColorCollections.SecondaryColor,
                          //               borderRadius:
                          //                   BorderRadius.circular(10)),
                          //           child: Center(
                          //             child: ReusableText(
                          //               TextColor: ColorCollections.Black,
                          //               TextString: 'Partner Login',
                          //               FontSize: 18,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           Navigator.of(context)
                          //               .pushNamed('/admin_home_page');
                          //         },
                          //         child: Container(
                          //           height: 40,
                          //           width: 150,
                          //           decoration: BoxDecoration(
                          //               color: ColorCollections.TeritiaryColor,
                          //               borderRadius:
                          //                   BorderRadius.circular(10)),
                          //           child: Center(
                          //             child: ReusableText(
                          //               TextString: 'Admin Login',
                          //               FontSize: 18,
                          //               TextColor:
                          //                   ColorCollections.PrimaryColor,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // Center(
                    //   child: Container(
                    //     margin: EdgeInsets.only(top: 0.sp),
                    //     height: 200,
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage(
                    //             'assets/logos/tlefli_app.jpg',
                    //           ),
                    //           fit: BoxFit.fill),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
