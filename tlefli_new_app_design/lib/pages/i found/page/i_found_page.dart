import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/pages/i%20lost/bloc/i_lost_bloc.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';


class i_found_page extends StatelessWidget {
  const i_found_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      body: BlocConsumer<ILostBloc, ILostState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Column(
                    children: [
                      ReusableText(
                        FromTop: 10,
                        TextString: 'Keep up the good work!',
                        TextColor: ColorCollections.Black,
                        FontSize: 24,
                        TextFontWeight: FontWeight.bold,
                      ),
                      ReusableText(
                        TextString: 'Please fill the form correctly',
                        TextColor: const Color.fromARGB(255, 106, 106, 104),
                        FontSize: 20,
                        TextFontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableText(
                      TextString: 'Name of item',
                      FontSize: 13,
                      TextColor: ColorCollections.Black,
                    ),
                    reusableTextField(
                      widthOfTextField: 150,
                      icon_name: 'item_name',
                      hintText: 'name of item',
                      textType: 'item_name',
                      onchange: (onchange) {},
                    ),
                    ReusableText(
                      TextString: 'Item Catagory',
                      FontSize: 13,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: ColorCollections.PrimaryColor,
                          borderRadius: BorderRadius.circular(7)),
                      // margin: EdgeInsets.only(left: 30),
                      child: DropdownButtonFormField(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Container(
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.only(right: 20),
                            child: Image.asset(
                                'assets/icons/flat_icons/categories.png'),
                          ),
                        ),
                        focusColor: const Color.fromARGB(255, 237, 236, 236),
                        style: TextStyle(color: ColorCollections.Black),
                        value:
                            state is ItemNameState ? state.itemName! : 'None',
                        items: [
                          DropdownMenuItem(
                            value: 'None',
                            child: ReusableText(
                              FromTop: 0,
                              FromBottom: 0,
                              TextColor: ColorCollections.Black,
                              TextString: 'None',
                              FontSize: 16,
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Pets',
                            child: ReusableText(
                              FromTop: 0,
                              FromBottom: 0,
                              TextColor: ColorCollections.Black,
                              TextString: 'Pets',
                              FontSize: 16,
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Electronics',
                            child: ReusableText(
                              FromTop: 0,
                              FromBottom: 0,
                              TextColor: ColorCollections.Black,
                              TextString: 'Electronics',
                              FontSize: 16,
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Id',
                            child: ReusableText(
                              FromTop: 0,
                              FromBottom: 0,
                              TextColor: ColorCollections.Black,
                              TextString: 'Id card',
                              FontSize: 16,
                            ),
                          ),
                        ],
                        onChanged: (onChanged) {
                          context
                              .read<ILostBloc>()
                              .add(ItemNameEvent(itemName: onChanged));
                        },
                      ),
                    ),
                    ReusableText(
                      TextString: 'Desciption',
                      FontSize: 13,
                      TextColor: ColorCollections.Black,
                    ),
                    reusableTextField(
                      widthOfTextField: 150,
                      icon_name: 'description',
                      hintText: 'type the discription',
                      textType: 'item_description',
                      onchange: (onchange) {},
                    ),
                    ReusableText(
                      TextString: 'Upload the photo(optional)',
                      FontSize: 13,
                      TextColor: ColorCollections.Black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 5),
                      height: 120,
                      width: 200,
                      decoration: BoxDecoration(
                        color: ColorCollections.PrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.photo_camera_back_outlined,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  return CustomShowDialoge(context);
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: ColorCollections.TeritiaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: ReusableText(
                        TextString: 'Find',
                        TextColor: ColorCollections.PrimaryColor,
                        FontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
