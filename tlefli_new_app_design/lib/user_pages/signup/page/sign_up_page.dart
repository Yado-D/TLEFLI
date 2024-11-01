import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/auth/signupAuth/signup_auth.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/user_pages/signup/bloc/signup_bloc.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({super.key});

  @override
  State<sign_up_page> createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {
  bool isSignUp = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            child: Scaffold(
              backgroundColor: ColorCollections.PrimaryColor,
              body: ListView(children: [
                Stack(
                  children: [
                    const FullPageContainer(),
                    Container(
                      margin: EdgeInsets.only(top: 210.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: ReusableText(
                              TextString: AppLocalizations.of(context)!.signup,
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
                                    AppLocalizations.of(context)!.firstName,
                                FontSize: 13,
                                TextColor: ColorCollections.Black,
                                TextFontWeight: FontWeight.bold,
                              ),
                              Center(
                                child: reusableTextField(
                                  // FromLeft: 20,
                                  icon_name: 'b_user',
                                  hintText: AppLocalizations.of(context)!
                                      .typeYourFirstName,
                                  textType: 'first_name',
                                  onchange: (onchange) {
                                    context
                                        .read<SignupBloc>()
                                        .add(FNameEvent(onchange));
                                  },
                                ),
                              ),
                              ReusableText(
                                FromTop: 10,
                                FromLeft: 45,
                                TextString:
                                    AppLocalizations.of(context)!.lastName,
                                FontSize: 13,
                                TextColor: ColorCollections.Black,
                                TextFontWeight: FontWeight.bold,
                              ),
                              Center(
                                child: reusableTextField(
                                  // FromLeft: 20,
                                  icon_name: 'b_user',
                                  hintText: AppLocalizations.of(context)!
                                      .typeYourLastName,
                                  textType: 'last_name',
                                  onchange: (onchange) {
                                    context
                                        .read<SignupBloc>()
                                        .add(LNameEvent(onchange));
                                  },
                                ),
                              ),
                              ReusableText(
                                FromTop: 10,
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
                                        .read<SignupBloc>()
                                        .add(EmailEvent(onchange));
                                  },
                                ),
                              ),
                              ReusableText(
                                FromTop: 10,
                                FromLeft: 45,
                                TextString: 'Phone Number',
                                FontSize: 13,
                                TextColor: ColorCollections.Black,
                                TextFontWeight: FontWeight.bold,
                              ),
                              Center(
                                child: reusableTextField(
                                  icon_name: 'phone-call',
                                  hintText: 'type the phone',
                                  textType: 'phone',
                                  onchange: (onchange) {
                                    context
                                        .read<SignupBloc>()
                                        .add(PhoneEvent(onchange));
                                  },
                                ),
                              ),
                              ReusableText(
                                FromTop: 10,
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
                                        .read<SignupBloc>()
                                        .add(PasswordEvent(onchange));
                                  },
                                ),
                              ),
                              ReusableText(
                                FromTop: 10,
                                FromLeft: 45,
                                TextString: AppLocalizations.of(context)!
                                    .confirmPassword,
                                FontSize: 13,
                                TextColor: ColorCollections.Black,
                                TextFontWeight: FontWeight.bold,
                              ),
                              Center(
                                child: reusableTextField(
                                  // FromLeft: 20,
                                  icon_name: 'lock',
                                  hintText: AppLocalizations.of(context)!
                                      .confirmPassword,
                                  textType: 'password',
                                  onchange: (onchange) {
                                    context.read<SignupBloc>().add(
                                        PasswordConfirmationEvent(onchange));
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 53),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BlocConsumer<SignupBloc, SignupState>(
                                      listener: (context, state) {
                                        // TODO: implement listener
                                      },
                                      builder: (context, state) {
                                        return Checkbox(
                                          value: state.reciveInfo,
                                          onChanged: (onChanged) {
                                            context.read<SignupBloc>().add(
                                                ReciveInfoEvent(onChanged!));
                                          },
                                        );
                                      },
                                    ),
                                    ReusableText(
                                      TextString: AppLocalizations.of(context)!
                                          .iAgreeToReceive,
                                      FontSize: 14,
                                      TextColor: ColorCollections.Black,
                                      TextFontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 53),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BlocConsumer<SignupBloc, SignupState>(
                                      listener: (context, state) {},
                                      builder: (context, state) {
                                        return Checkbox(
                                          value: state.acceptPrivacy,
                                          onChanged: (onChanged) {
                                            context.read<SignupBloc>().add(
                                                AcceptPrivacyEvent(onChanged!));
                                          },
                                        );
                                      },
                                    ),
                                    ReusableText(
                                      TextString: AppLocalizations.of(context)!
                                          .yesIAccept,
                                      FontSize: 14,
                                      TextColor: ColorCollections.Black,
                                      TextFontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          BlocConsumer<SignupBloc, SignupState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isSignUp = false;
                                  });
                                  // String res = 'user_verified';
                                  // await Future.delayed(Duration(seconds: 3));
                                  String res =
                                      await SignupAuth.SignupAuthentication(
                                    context: context,
                                    fName: state.fName.trim(),
                                    lName: state.lName.trim(),
                                    email: state.email.trim(),
                                    password: state.password.trim(),
                                    confirmPassword:
                                        state.passwordComfirmation.trim(),
                                    reciveInfo: state.reciveInfo,
                                    acceptPrivacy: state.acceptPrivacy,
                                    phone: state.phoneNumber.trim(),
                                  );
                                  if (res == 'user_verified') {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/home_page', (route) => false);
                                    setState(() {
                                      isSignUp = true;
                                    });
                                    print('user is sign up');
                                  } else {
                                    setState(() {
                                      isSignUp = true;
                                    });
                                    commonSnackBar(context, res);
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 40),
                                  height: 45.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    color: ColorCollections.TeritiaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: ReusableText(
                                      TextString:
                                          AppLocalizations.of(context)!.signup,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableText(
                                  TextString: AppLocalizations.of(context)!
                                      .alreadyHaveAnAccount,
                                  FontSize: 15,
                                  TextColor:
                                      const Color.fromARGB(255, 147, 150, 147),
                                  TextFontWeight: FontWeight.w500,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: ReusableText(
                                    TextString:
                                        AppLocalizations.of(context)!.login,
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w900,
                                    TextColor: ColorCollections.Black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
                  ],
                ),
              ]),
            ),
          ),
        ),
        isSignUp == false
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
    );
  }
}
