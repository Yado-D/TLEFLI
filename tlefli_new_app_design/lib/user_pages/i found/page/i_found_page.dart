// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
// import 'package:tlefli_new_app_design/user_pages/home/widget/all_common_widget.dart';
// import 'package:tlefli_new_app_design/user_pages/i%20lost/bloc/i_lost_bloc.dart';
// import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

// class i_found_page extends StatefulWidget {
//   const i_found_page({super.key});

//   @override
//   State<i_found_page> createState() => _i_found_pageState();
// }

// class _i_found_pageState extends State<i_found_page> {
//   File? pickedFile;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorCollections.SecondaryColor,
//       body: BlocConsumer<ILostBloc, ILostState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       ReusableText(
//                         FromTop: 10,
//                         TextString: 'Keep up the good work!',
//                         TextColor: ColorCollections.Black,
//                         FontSize: 24,
//                         TextFontWeight: FontWeight.bold,
//                       ),
//                       ReusableText(
//                         TextString: 'Please fill the form correctly',
//                         TextColor: const Color.fromARGB(255, 106, 106, 104),
//                         FontSize: 20,
//                         TextFontWeight: FontWeight.w500,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(left: 35, top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     ReusableText(
//                       TextString: 'Name of item',
//                       FontSize: 13,
//                       TextColor: ColorCollections.Black,
//                     ),
//                     reusableTextField(
//                       widthOfTextField: 150,
//                       icon_name: 'item_name',
//                       hintText: 'name of item',
//                       textType: 'item_name',
//                       onchange: (onchange) {},
//                     ),
//                     ReusableText(
//                       TextString: 'Item Catagory',
//                       FontSize: 13,
//                       TextColor: ColorCollections.Black,
//                     ),
//                     CommonDropdownButtons(
//                       items: item_list,
//                       onChanged: (onChanged) {
//                         context
//                             .read<ILostBloc>()
//                             .add(ItemNameEvent(itemName: onChanged));
//                       },
//                     ),
//                     ReusableText(
//                       TextString: 'Desciption',
//                       FontSize: 13,
//                       TextColor: ColorCollections.Black,
//                     ),
//                     reusableTextField(
//                       widthOfTextField: 150,
//                       icon_name: 'description',
//                       hintText: 'type the discription',
//                       textType: 'item_description',
//                       onchange: (onchange) {},
//                     ),
//                     ReusableText(
//                       TextString: 'Upload the photo(optional)',
//                       FontSize: 13,
//                       TextColor: ColorCollections.Black,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 10, top: 5),
//                       height: 120,
//                       width: 200,
//                       decoration: BoxDecoration(
//                         color: ColorCollections.PrimaryColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: pickedFile == null
//                           ? Center(
//                               child: IconButton(
//                                 onPressed: () async {
//                                   await _pickedImageFromGallery(
//                                       ImageSource.gallery);
//                                 },
//                                 icon: Icon(
//                                   Icons.photo_camera_back_outlined,
//                                   size: 30,
//                                 ),
//                               ),
//                             )
//                           : Image.file(
//                               pickedFile!,
//                               fit: BoxFit.fill,
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   return CustomShowDialoge(context,);
//                 },
//                 child: Center(
//                   child: Container(
//                     margin: EdgeInsets.only(top: 30),
//                     height: 50,
//                     width: 150,
//                     decoration: BoxDecoration(
//                       color: ColorCollections.TeritiaryColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: ReusableText(
//                         TextString: 'Find',
//                         TextColor: ColorCollections.PrimaryColor,
//                         FontSize: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Future _pickedImageFromGallery(ImageSource source) async {
//     final filePicker = await ImagePicker().pickImage(source: source);
//     if (filePicker == null) return;
//     setState(() {
//       pickedFile = File(filePicker.path);
//     });
//   }

//   List<String> item_list = [
//     'Electronics',
//     'Id Card',
//     'Pets',
//   ];
// }
