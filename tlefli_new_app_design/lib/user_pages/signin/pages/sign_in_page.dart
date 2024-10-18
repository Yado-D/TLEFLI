import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/auth/signinAuth/signin_auth.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/common/CommonSnackBar.dart';
import 'package:tlefli_new_app_design/user_pages/signin/bloc/signin_bloc.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class sign_in_page extends StatelessWidget {
  const sign_in_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: ListView(
          children: [
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
                          TextString: "Login",
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
                                  .read<SigninBloc>()
                                  .add(EmailEvent(onchange));
                            },
                          ),
                          ReusableText(
                            FromTop: 20,
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
                                  .read<SigninBloc>()
                                  .add(PasswordEvent(onchange));
                            },
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
                              TextString: "Forgot password?",
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
                                commonSnackBar(
                                    context, 'welcome back my friend');
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/home_page', (route) => false);
                              } else {
                                commonSnackBar(context, res);
                              }
                            },
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
                                  TextString: 'Log In',
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
                              TextString: 'Don\'t have an account?',
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
                                TextString: 'Sign Up',
                                FontSize: 18,
                                TextFontWeight: FontWeight.w900,
                                TextColor: ColorCollections.Black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/partner_home');
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20, right: 10),
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: ColorCollections.SecondaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: ReusableText(
                                    TextColor: ColorCollections.Black,
                                    TextString: 'Partner Login',
                                    FontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/admin_home_page');
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: ColorCollections.TeritiaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: ReusableText(
                                    TextString: 'Admin Login',
                                    FontSize: 18,
                                    TextColor: ColorCollections.PrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
