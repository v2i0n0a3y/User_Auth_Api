// viewmodels/farm_info_viewmodel.dart
import 'package:flutter/material.dart';

import 'farm_info_model.dart';

class FarmInfoViewModel extends ChangeNotifier {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController informalNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();

  String? selectedState;
  final List<String> states = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka',
    'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya',
    'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim',
    'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand',
    'West Bengal', 'Andaman and Nicobar Islands', 'Chandigarh', 'Lakshadweep',
    'Delhi', 'Puducherry'
  ];

  void setSelectedState(String? state) {
    selectedState = state;
    notifyListeners();
  }

  FarmInfoModel getFarmInfo() {
    return FarmInfoModel(
      businessName: businessNameController.text,
      informalName: informalNameController.text,
      address: addressController.text,
      city: cityController.text,
      zipcode: zipcodeController.text,
      selectedState: selectedState,
    );
  }

  @override
  void dispose() {
    businessNameController.dispose();
    informalNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    zipcodeController.dispose();
    super.dispose();
  }
}
