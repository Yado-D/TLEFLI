import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

Widget paymentDescriptionContainer(
  BuildContext context,
  bool isCurrent,
  String icon,
  String TextString,
) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
    height: 80,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: isCurrent
          ? ColorCollections.TeritiaryColor
          : ColorCollections.SecondaryColor,
      border: Border.symmetric(
        horizontal: BorderSide(
          color: ColorCollections.SecondaryColor,
          width: 2,
        ),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 60,
          child: SvgPicture.asset('assets/icons/$icon'),
        ),
        // Icon(icon),
        ReusableText(
          TextString: TextString,
          FontSize: 20,
          TextColor: isCurrent
              ? ColorCollections.PrimaryColor
              : ColorCollections.Black,
        )
      ],
    ),
  );
}
