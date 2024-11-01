import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class GetUserDetails extends StatefulWidget {
  UserData? userData;

  GetUserDetails({
    super.key,
    required this.userData,
  });

  @override
  State<GetUserDetails> createState() => _GetUserDetailsState();
}

class _GetUserDetailsState extends State<GetUserDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 3,
      vsync: this,
    );
    return Scaffold(
      appBar: SimpleAppBars(context, 'User Details'),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: ColorCollections.PrimaryColor,
                expandedHeight: 320,
                flexibleSpace: ListView(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorCollections.SecondaryColor),
                              borderRadius: BorderRadius.circular(75),
                              color: ColorCollections.Black,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(widget.userData!.userImage),
                              ),
                            ),
                          ),
                        ),
                        ReusableText(
                          TextString: widget.userData!.userFname +
                              " " +
                              widget.userData!.userLname,
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                        ReusableText(
                          FromTop: 0,
                          TextString: widget.userData!.userPhone,
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                        ReusableText(
                          FromTop: 0,
                          TextString: widget.userData!.userEmail,
                          FontSize: 20,
                          TextColor: ColorCollections.Black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorCollections.TeritiaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 130,
                    child: Center(
                      child: ReusableText(
                        TextColor: ColorCollections.Black,
                        TextString: 'Lost items',
                        FontSize: 18,
                      ),
                    ),
                  ),
                  ReusableText(
                    TextString: '20',
                    FontSize: 20,
                    TextColor: ColorCollections.Black,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorCollections.TeritiaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 130,
                    child: Center(
                      child: ReusableText(
                        TextColor: ColorCollections.Black,
                        TextString: 'Found items',
                        FontSize: 18,
                      ),
                    ),
                  ),
                  ReusableText(
                    TextColor: ColorCollections.Black,
                    TextString: '8',
                    FontSize: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorCollections.TeritiaryColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 130,
                    child: Center(
                      child: ReusableText(
                        TextColor: ColorCollections.Black,
                        TextString: 'Match items',
                        FontSize: 18,
                      ),
                    ),
                  ),
                  ReusableText(
                    TextColor: ColorCollections.Black,
                    TextString: '10',
                    FontSize: 20,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
