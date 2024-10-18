import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorCollections.SecondaryColor,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(left: 25, top: 50),
            child: ListView(
              children: [
                Text(
                  "YOUR",
                  style: GoogleFonts.quicksand(fontSize: 50.sp),
                ),
                Text(
                  "LOST",
                  style: GoogleFonts.quicksand(
                      fontSize: 50.sp, fontWeight: FontWeight.w900),
                ),
                Text(
                  "ITEMS,",
                  style: GoogleFonts.quicksand(fontSize: 50.sp),
                ),
                Text(
                  "OUR",
                  style: GoogleFonts.quicksand(fontSize: 50.sp),
                ),
                Text(
                  "PRIORITY!",
                  style: GoogleFonts.quicksand(
                      fontSize: 50.sp, fontWeight: FontWeight.w900),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/sign_in_page', (route) => false);
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 150),
                      height: 60.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                          color: ColorCollections.TeritiaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Lets find it!",
                          style: TextStyle(
                            color: ColorCollections.PrimaryColor,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
