import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlefli_new_app_design/auth/API/api_services.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/models/user_data_model.dart';
import 'package:tlefli_new_app_design/services/constants.dart';
import 'package:tlefli_new_app_design/services/global.dart';
import 'package:tlefli_new_app_design/user_pages/my_object/newMyObjectPage.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class GetAllReportedItems extends StatefulWidget {
  const GetAllReportedItems({super.key});

  @override
  State<GetAllReportedItems> createState() => _GetAllReportedItemsState();
}

class _GetAllReportedItemsState extends State<GetAllReportedItems> {
  Future<Map<String, dynamic>>? userPosts;
  UserData? userData;
  @override
  void initState() {
    //featch the data from database in the itemPickedModel
    //  Future<void> getMyObjectValue()async{
    //     my_object
    //  }
    userData = Global.storageServices.getData(AppConstants.USER_DATA)!;
    userPosts = ApiService().GetAllReportedItem(userData!.token['accessToken']);

    print(userPosts);
    super.initState();
  }

  String formattedDate(String isoString) {
    final dateTime = DateTime.parse(isoString);
    final formatter = DateFormat('dd MMM, yyyy h:mm a');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBars(context, 'All user reports'),
      backgroundColor: ColorCollections.PrimaryColor,
      body: FutureBuilder(
        future: userPosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  ReusableText(
                    TextString:
                        'Hmm,there is some error,check internet connection.',
                    FontSize: 14,
                  ),
                ],
              ),
            );
          }
          if (snapshot.hasData && snapshot.data!['items'] != null) {
            print('${snapshot.data!}');
            return Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(),
              height: 700,
              child: ListView.builder(
                itemCount: snapshot.data!["items"].length,
                itemBuilder: (context, index) {
                  var snap = snapshot.data!['items'][index];
                  return Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 246, 246, 246),
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: ColorCollections.SecondaryColor),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(snap['itemImage']),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                List<String> location =
                                    snap['location'].split(" ");
                                itemPickedModel item_model = itemPickedModel(
                                  main_catagory: snap['category'],
                                  nested_item: snap['subcategory'],
                                  address: location[0],
                                  city: location[1],
                                  date_picked: formattedDate(snap['date']),
                                  time_picked: '',
                                  item_description: snap['description'],
                                  bread: '',
                                  item_color: '',
                                  item_model: '',
                                  owner:
                                      userData!.userFname + userData!.userLname,
                                  lostOrFound: '',
                                  pickedImage: snap['itemImage'],
                                  defoultId: snap['_id'],
                                );
                                print(snap['_id']);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MyObjectDetailPage(
                                      item_model: item_model,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 10, left: 35, bottom: 5, top: 5),
                                height: 40,
                                width: 97,
                                decoration: BoxDecoration(
                                  color: ColorCollections.TeritiaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: ColorCollections.SecondaryColor),
                                ),
                                child: Center(
                                  child: ReusableText(
                                    TextString: 'Check',
                                    FontSize: 18,
                                    TextColor: ColorCollections.PrimaryColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        ReusableText(
                          FromBottom: 2,
                          TextColor: ColorCollections.Black,
                          TextString: snap['subcategory'],
                          FontSize: 20,
                        ),
                        ReusableText(
                          FromBottom: 2,
                          TextColor: ColorCollections.Black,
                          TextString: formattedDate(snap['date']),
                          FontSize: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableText(
                              FromBottom: 2,
                              TextColor: ColorCollections.Black,
                              TextString: snap['reported_by']['userName'] ?? "",
                              FontSize: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text('${snapshot.data!}'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
