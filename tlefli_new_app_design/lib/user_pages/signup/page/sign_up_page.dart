import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/auth/signupAuth/signup_auth.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/user_pages/signup/bloc/signup_bloc.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class sign_up_page extends StatelessWidget {
  const sign_up_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: ColorCollections.PrimaryColor,
        body: ListView(children: [
          Stack(
            children: [
              const FullPageContainer(),
              Container(
                margin: EdgeInsets.only(top: 200.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ReusableText(
                        TextString: "Sign Up",
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
                          TextString: "First Name",
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'b_user',
                          hintText: 'type your first name',
                          textType: 'first_name',
                          onchange: (onchange) {
                            context
                                .read<SignupBloc>()
                                .add(FNameEvent(onchange));
                          },
                        ),
                        ReusableText(
                          FromTop: 10,
                          FromLeft: 45,
                          TextString: "Last Name",
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'b_user',
                          hintText: 'type your last name',
                          textType: 'last_name',
                          onchange: (onchange) {
                            context
                                .read<SignupBloc>()
                                .add(LNameEvent(onchange));
                          },
                        ),
                        ReusableText(
                          FromTop: 10,
                          FromLeft: 45,
                          TextString: "E-mail",
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'mail',
                          hintText: 'type your email',
                          textType: 'email',
                          onchange: (onchange) {
                            context
                                .read<SignupBloc>()
                                .add(EmailEvent(onchange));
                          },
                        ),
                        ReusableText(
                          FromTop: 10,
                          FromLeft: 45,
                          TextString: "Password",
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'lock',
                          hintText: 'type your password',
                          textType: 'password',
                          onchange: (onchange) {
                            context
                                .read<SignupBloc>()
                                .add(PasswordEvent(onchange));
                          },
                        ),
                        ReusableText(
                          FromTop: 10,
                          FromLeft: 45,
                          TextString: "Confirm Password",
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'lock',
                          hintText: 'confirm your password',
                          textType: 'password',
                          onchange: (onchange) {
                            context
                                .read<SignupBloc>()
                                .add(PasswordConfirmationEvent(onchange));
                          },
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocConsumer<SignupBloc, SignupState>(
                                listener: (context, state) {
                                  // TODO: implement listener
                                },
                                builder: (context, state) {
                                  return Checkbox(
                                    value: state.reciveInfo,
                                    onChanged: (onChanged) {
                                      context
                                          .read<SignupBloc>()
                                          .add(ReciveInfoEvent(onChanged!));
                                    },
                                  );
                                },
                              ),
                              ReusableText(
                                TextString:
                                    "I agree to receive information and\n comertial offers from TLEFLI \n partners(email,text messages).",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlocConsumer<SignupBloc, SignupState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return Checkbox(
                                  value: state.acceptPrivacy,
                                  onChanged: (onChanged) {
                                    context
                                        .read<SignupBloc>()
                                        .add(AcceptPrivacyEvent(onChanged!));
                                  },
                                );
                              },
                            ),
                            ReusableText(
                              TextString: "Yes,i accept privacy policy",
                              FontSize: 14,
                              TextColor: ColorCollections.Black,
                              TextFontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                    BlocConsumer<SignupBloc, SignupState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () async {
                            String res = await SignupAuth.SignupAuthentication(
                              context: context,
                              fName: state.fName,
                              lName: state.lName,
                              email: state.email,
                              password: state.password,
                              confirmPassword: state.passwordComfirmation,
                              reciveInfo: state.reciveInfo,
                              acceptPrivacy: state.acceptPrivacy,
                            );
                            if (res == 'welcome my friend') {
                              commonSnackBar(context, res);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/home_page', (route) => false);
                            } else {
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
                                TextString: 'Sign Up',
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
                            TextString: 'Already have an account?',
                            FontSize: 15,
                            TextColor: const Color.fromARGB(255, 147, 150, 147),
                            TextFontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: ReusableText(
                              TextString: 'Sign In',
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
            ],
          ),
        ]),
      ),
    );
  }
}
