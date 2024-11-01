import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class Splash extends StatefulWidget {
  final bool isUserLoggedIn;

  const Splash({Key? key, required this.isUserLoggedIn}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => widget.isUserLoggedIn
          ? Navigator.of(context).pushNamed('/home_page')
          : Navigator.of(context).pushNamed('/welcome_page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Lottie.asset('assets/images/start_page.json'),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: CircularProgressIndicator(
              color: ColorCollections.TeritiaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
