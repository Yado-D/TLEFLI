import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/auth/signupAuth/signup_auth.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/user_pages/signup/bloc/signup_bloc.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                          TextString: AppLocalizations.of(context)!.firstName,
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'b_user',
                          hintText:
                              AppLocalizations.of(context)!.typeYourFirstName,
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
                          TextString: AppLocalizations.of(context)!.lastName,
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'b_user',
                          hintText:
                              AppLocalizations.of(context)!.typeYourLastName,
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
                          TextString: AppLocalizations.of(context)!.email,
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'mail',
                          hintText: AppLocalizations.of(context)!.typeEmail,
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
                          TextString: AppLocalizations.of(context)!.password,
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'lock',
                          hintText: AppLocalizations.of(context)!.typePassword,
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
                          TextString:
                              AppLocalizations.of(context)!.confirmPassword,
                          FontSize: 13,
                          TextColor: ColorCollections.Black,
                          TextFontWeight: FontWeight.bold,
                        ),
                        reusableTextField(
                          FromLeft: 20,
                          icon_name: 'lock',
                          hintText:
                              AppLocalizations.of(context)!.confirmPassword,
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
                                      context
                                          .read<SignupBloc>()
                                          .add(ReciveInfoEvent(onChanged!));
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
                                      context
                                          .read<SignupBloc>()
                                          .add(AcceptPrivacyEvent(onChanged!));
                                    },
                                  );
                                },
                              ),
                              ReusableText(
                                TextString:
                                    AppLocalizations.of(context)!.yesIAccept,
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
                            TextColor: const Color.fromARGB(255, 147, 150, 147),
                            TextFontWeight: FontWeight.w500,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: ReusableText(
                              TextString: AppLocalizations.of(context)!.login,
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
