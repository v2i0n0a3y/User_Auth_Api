// models/farm_info_model.dart
class FarmInfoModel {
  String businessName;
  String informalName;
  String address;
  String city;
  String zipcode;
  String? selectedState;

  FarmInfoModel({
    required this.businessName,
    required this.informalName,
    required this.address,
    required this.city,
    required this.zipcode,
    this.selectedState,
  });
}

