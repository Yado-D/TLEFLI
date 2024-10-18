///**********partner can see user request ************ */

List<partnerRequestModel> partner1 = [];
List<partnerRequestModel> partner2 = [];
List<partnerRequestModel> partner3 = [];
List<partnerRequestModel> partner4 = [];

///**********partner can see rejected request and accepted also ************ */

List<partnerRequestModel> partner1_rejected_list = [];
List<partnerRequestModel> partner2_rejected_list = [];
List<partnerRequestModel> partner3_rejected_list = [];
List<partnerRequestModel> partner4_rejected_list = [];

///**********partner can see rejected request and accepted also ************ */

List<partnerRequestModel> partner1_accepted_list = [];
List<partnerRequestModel> partner2_accepted_list = [];
List<partnerRequestModel> partner3_accepted_list = [];
List<partnerRequestModel> partner4_accepted_list = [];

class partnerRequestModel {
  final String status;
  final String image_url;
  final String item_name;
  final String date;
  final String description;
  final String? brand;
  final String? race;
  const partnerRequestModel({
    required this.status,
    required this.image_url,
    required this.item_name,
    required this.date,
    required this.description,
    this.brand,
    this.race,
  });
}
