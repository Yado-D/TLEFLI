import 'package:flutter/material.dart';
import 'package:tlefli_new_app_design/common/AllCommonWidget.dart';
import 'package:tlefli_new_app_design/models/item_reported_model.dart';
import 'package:tlefli_new_app_design/utils/AppColorCollections.dart';

class type_location_page extends StatefulWidget {
  final itemPickedModel item_model;

  type_location_page({Key? key, required this.item_model}) : super(key: key);

  @override
  State<type_location_page> createState() => _TypeLocationPageState();
}

class _TypeLocationPageState extends State<type_location_page> {
  String locationWrite = '';
  List<String> matchedLocations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorCollections.SecondaryColor,
      appBar: AppBar(
        backgroundColor: ColorCollections.TeritiaryColor,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: 120,
          padding: EdgeInsets.only(top: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorCollections.PrimaryColor,
                ),
              ),
              reusableTextField(
                FromBottom: 5,
                WidthOfContainer: 280,
                icon_name: 'item_name',
                hintText: 'type the location',
                textType: 'location',
                onchange: (value) {
                  locationWrite = value;
                  setState(() {
                    matchedLocations = listOfCity
                        .where((city) => city == locationWrite)
                        .toList();
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: matchedLocations.isEmpty
            ? [
                Center(
                    child: ReusableText(
                        FromTop: 250,
                        TextString: 'No match location.',
                        FontSize: 16))
              ]
            : matchedLocations
                .map((location) => GestureDetector(
                      onTap: () {
                        widget.item_model.city = location;
                        Navigator.pop(context);
                        // Add logic to navigate or handle the chosen location
                      },
                      child: Container(
                        color: const Color.fromARGB(255, 249, 249, 249),
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              FromLeft: 20,
                              TextString: location,
                              FontSize: 20,
                              TextColor: ColorCollections.Black,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 3),
                              height: 1,
                              color: const Color.fromARGB(255, 179, 179, 178),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
      ),
    );
  }

  List<String> listOfCity = [
    'Casablanca',
    'Fès',
    'Tanger',
    'Marrakech',
    'Salé',
    'Agadir',
    'Meknès',
    'Rabat',
    'Oujda',
    'Kenitra',
    'Tétouan',
    'Témara',
    'Safi',
    'Mohammedia',
    'Laayoune',
    'El Jadida',
    'Khouribga',
    'Beni Mellal',
    'Nador',
    'Guelmim',
    'Settat',
    'Khemisset',
    'Taza',
    'Larache',
    'Ait Melloul',
    'Al Hoceima',
    'Bouskoura',
    'Inezgane',
    'Berkane',
    'Khenifra',
    'Taourirt',
    'Ben Guerir',
    'Dakhla',
    'Dcheira el Jihadia',
    'Errachidia',
    'Sidi Slimane',
    'Tiznit',
    'Taroudant',
    'Guercif',
    'Essaouira',
    'Sidi Kacem'
  ];
}
