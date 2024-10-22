import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/error_page/error_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/bloc/home_bloc.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/home_widget.dart';
import 'package:tlefli_new_app_design/user_pages/i%20found/page/i_found_page.dart';
import 'package:tlefli_new_app_design/user_pages/i%20lost/page/i_lost_page.dart';
import 'package:tlefli_new_app_design/user_pages/more/page/more_page.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/my_object_page.dart';
import 'package:tlefli_new_app_design/user_pages/my_match/my_matchs_page.dart';
import 'package:tlefli_new_app_design/user_pages/profile/page/profile_page.dart';
import 'package:tlefli_new_app_design/user_pages/request/page/request_page.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});
  @override
  State<home_page> createState() => _homeState();
}

class _homeState extends State<home_page> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> globKey = GlobalKey();
  late AnimationController _controller;
  late Animation<Offset> _icon1Animation;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _icon1Animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    Future.delayed(Duration(seconds: 2), () {
      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrowerElement(() {
          globKey.currentState!.closeDrawer();
        }, context, animation),
        key: globKey,
        backgroundColor: ColorCollections.SecondaryColor,
        appBar: ReusableAppBar(() {
          print("cliked1");

          globKey.currentState!.openDrawer();
          print("cliked");
        }, context),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(
                children: [
                  state is BottomNavBarState
                      ? state.SelectedIndex == 0
                          ? my_match_page(animation: animation)
                          : state.SelectedIndex == 1
                              ? my_object_page()
                              : state.SelectedIndex == 2
                                  ? home_widget(context, animation)
                                  : state.SelectedIndex == 3
                                      ? profile_page()
                                      : state.SelectedIndex == 4
                                          ? more_page(context)
                                          : error_page()
                      : home_widget(context, animation),
                  Positioned(
                    bottom: 0,
                    height: 57.h,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: ColorCollections.PrimaryColor,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: const Color.fromARGB(255, 213, 213, 213),
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(BottomNavBarEvent(SelectedIndex: 3));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/flat_icons/person.svg',
                                        height: 25.h,
                                        width: 25.w,
                                        color: const Color.fromARGB(
                                            255, 128, 128, 128),
                                      ),
                                      ReusableText(
                                        FromTop: 5,
                                        FromBottom: 0,
                                        TextString:
                                            AppLocalizations.of(context)!
                                                .profile,
                                        FontSize: 12,
                                        TextColor: state is BottomNavBarState
                                            ? state.SelectedIndex == 3
                                                ? ColorCollections
                                                    .TeritiaryColor
                                                : ColorCollections.Black
                                            : ColorCollections.Black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(BottomNavBarEvent(SelectedIndex: 1));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        height: 25.h,
                                        width: 25.w,
                                        child: Image.asset(
                                            'assets/icons/flat_icons/my_matchs.png'),
                                      ),
                                      ReusableText(
                                        FromTop: 5,
                                        FromBottom: 0,
                                        TextString:
                                            AppLocalizations.of(context)!
                                                .myObject,
                                        FontSize: 12,
                                        TextColor: state is BottomNavBarState
                                            ? state.SelectedIndex == 1
                                                ? ColorCollections
                                                    .TeritiaryColor
                                                : ColorCollections.Black
                                            : ColorCollections.Black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(BottomNavBarEvent(SelectedIndex: 0));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 25.h,
                                        width: 25.w,
                                        margin: EdgeInsets.only(top: 15),
                                        child: SvgPicture.asset(
                                          'assets/icons/flat_icons/holding.svg',
                                          height: 20.h,
                                          width: 20.w,
                                          color: const Color.fromARGB(
                                              255, 128, 128, 128),
                                        ),
                                      ),
                                      ReusableText(
                                        TextString:
                                            AppLocalizations.of(context)!
                                                .myMatches,
                                        FontSize: 12,
                                        TextColor: state is BottomNavBarState
                                            ? state.SelectedIndex == 0
                                                ? ColorCollections
                                                    .TeritiaryColor
                                                : ColorCollections.Black
                                            : ColorCollections.Black,
                                        FromBottom: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<HomeBloc>()
                                      .add(BottomNavBarEvent(SelectedIndex: 4));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 5, top: 15),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/flat_icons/more.svg',
                                        height: 25.h,
                                        width: 25.w,
                                        color: const Color.fromARGB(
                                            255, 128, 128, 128),
                                      ),
                                      ReusableText(
                                        FromTop: 5,
                                        TextString:
                                            AppLocalizations.of(context)!.more,
                                        FontSize: 12,
                                        TextColor: state is BottomNavBarState
                                            ? state.SelectedIndex == 4
                                                ? ColorCollections
                                                    .TeritiaryColor
                                                : ColorCollections.Black
                                            : ColorCollections.Black,
                                        FromBottom: 0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 5,
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<HomeBloc>()
                                    .add(BottomNavBarEvent(SelectedIndex: 2));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 32.h,
                                    width: 34.w,
                                    child: Image.asset(
                                        fit: BoxFit.fill,
                                        'assets/icons/flat_icons/tlefli_logo.png'),
                                  ),
                                  ReusableText(
                                    FromTop: 5,
                                    FromBottom: 0,
                                    TextString:
                                        AppLocalizations.of(context)!.found,
                                    FontSize: 12,
                                    TextColor: state is BottomNavBarState
                                        ? state.SelectedIndex == 2
                                            ? ColorCollections.TeritiaryColor
                                            : ColorCollections.Black
                                        : ColorCollections.TeritiaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
