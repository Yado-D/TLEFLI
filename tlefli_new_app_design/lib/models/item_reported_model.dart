import 'dart:core';
import 'dart:typed_data';

class itemPickedModel {
  Uint8List? pickedImage;
  String? main_catagory;
  String? nested_item;
  String? location_choosed;
  String? date_picked;
  String? time_picked;
  String? item_description;
  String? race;
  String? item_color;
  String? item_model;

  itemPickedModel(
      {this.pickedImage,
      required this.main_catagory,
      required this.nested_item,
      required this.location_choosed,
      required this.date_picked,
      required this.time_picked,
      required this.item_description,
      required this.race,
      required this.item_color,
      required this.item_model});
}
