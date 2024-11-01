import 'dart:core';

class itemPickedModel {
  String? itemName;
  dynamic pickedImage;
  String? main_catagory;
  String? nested_item;
  String? address;
  String? city;
  String? date_picked;
  String? time_picked;
  String? item_description;
  String? bread;
  String? item_color;
  String? item_model;
  String? owner;
  String? lostOrFound;
  String? brand;
  String? keyType;
  String? numberOfKeys;
  String? idType;
  String? issuingAuthority;
  String? expiraionDate;
  String? passportCountry;
  String? creditCardIssuer;
  String? lastFourDigits;
  String? bookTitle;
  String? author;
  String? documentType;
  String? defoultId;

  itemPickedModel({
    this.pickedImage,
    required this.main_catagory,
    required this.nested_item,
    required this.address,
    required this.city,
    this.date_picked,
    this.time_picked,
    this.item_description,
    this.bread,
    this.item_color,
    this.item_model,
    this.owner,
    this.lostOrFound,
    this.author,
    this.bookTitle,
    this.brand,
    this.creditCardIssuer,
    this.documentType,
    this.expiraionDate,
    this.idType,
    this.issuingAuthority,
    this.itemName,
    this.keyType,
    this.lastFourDigits,
    this.numberOfKeys,
    this.passportCountry,
    this.defoultId,
  });
}
