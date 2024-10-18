import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/user_pages/error_page/error_page.dart';
import 'package:tlefli_new_app_design/user_pages/home/bloc/home_bloc.dart';
import 'package:tlefli_new_app_design/user_pages/home/widget/home_widget.dart';
import 'package:tlefli_new_app_design/user_pages/i%20found/page/i_found_page.dart';
import 'package:tlefli_new_app_design/user_pages/i%20lost/page/i_lost_page.dart';
import 'package:tlefli_new_app_design/user_pages/more/page/more_page.dart';
import 'package:tlefli_new_app_design/user_pages/profile/page/profile_page.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});
  @override
  State<home_page> createState() => _homeState();
}

class _homeState extends State<home_page> {
  GlobalKey<ScaffoldState> globKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrowerElement(() {
          globKey.currentState!.closeDrawer();
        }, context),
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
                          ? home_widget(context)
                          : state.SelectedIndex == 1
                              ? i_lost_page()
                              : state.SelectedIndex == 2
                                  ? i_found_page()
                                  : state.SelectedIndex == 3
                                      ? profile_page()
                                      : state.SelectedIndex == 4
                                          ? Expanded(
                                              child: more_page(context),
                                            )
                                          : error_page()
                      : home_widget(context),
                  Positioned(
                    bottom: 0.h,
                    height: 60.h,
                    child: Container(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(BottomNavBarEvent(SelectedIndex: 0));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  margin: EdgeInsets.only(top: 7),
                                  child: Image.asset(
                                    'assets/icons/flat_icons/b_home.png',
                                  ),
                                ),
                                ReusableText(
                                  TextString: 'Home',
                                  FontSize: 13,
                                  TextColor: state is BottomNavBarState
                                      ? state.SelectedIndex == 0
                                          ? ColorCollections.TeritiaryColor
                                          : ColorCollections.Black
                                      : ColorCollections.TeritiaryColor,
                                  FromBottom: 0,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(BottomNavBarEvent(SelectedIndex: 1));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 7),
                                  height: 20.h,
                                  width: 20.w,
                                  child: Image.asset(
                                    'assets/icons/flat_icons/confusing.png',
                                  ),
                                ),
                                ReusableText(
                                  FromBottom: 0,
                                  TextString: 'I lost',
                                  FontSize: 13,
                                  TextColor: state is BottomNavBarState
                                      ? state.SelectedIndex == 1
                                          ? ColorCollections.TeritiaryColor
                                          : ColorCollections.Black
                                      : ColorCollections.Black,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(BottomNavBarEvent(SelectedIndex: 2));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 7),
                                  height: 25.h,
                                  width: 25.w,
                                  child: Image.asset(
                                    'assets/icons/flat_icons/b_search.png',
                                  ),
                                ),
                                ReusableText(
                                  FromBottom: 0,
                                  TextString: 'I found',
                                  FontSize: 13,
                                  TextColor: state is BottomNavBarState
                                      ? state.SelectedIndex == 2
                                          ? ColorCollections.TeritiaryColor
                                          : ColorCollections.Black
                                      : ColorCollections.Black,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(BottomNavBarEvent(SelectedIndex: 3));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 7),
                                  height: 20.h,
                                  width: 20.w,
                                  child: Image.asset(
                                    'assets/icons/flat_icons/b_user.png',
                                  ),
                                ),
                                ReusableText(
                                  FromBottom: 0,
                                  TextString: 'Profile',
                                  FontSize: 13,
                                  TextColor: state is BottomNavBarState
                                      ? state.SelectedIndex == 3
                                          ? ColorCollections.TeritiaryColor
                                          : ColorCollections.Black
                                      : ColorCollections.Black,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<HomeBloc>()
                                  .add(BottomNavBarEvent(SelectedIndex: 4));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 5.w, top: 7),
                                  height: 25.h,
                                  width: 25.w,
                                  child: new Icon(
                                    Icons.more_horiz,
                                    size: 25.w,
                                    color: const Color.fromARGB(255, 14, 6, 6),
                                  ),
                                ),
                                ReusableText(
                                  TextString: 'More',
                                  FontSize: 13,
                                  TextColor: state is BottomNavBarState
                                      ? state.SelectedIndex == 4
                                          ? ColorCollections.TeritiaryColor
                                          : ColorCollections.Black
                                      : ColorCollections.Black,
                                  FromBottom: 0,
                                ),
                              ],
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
