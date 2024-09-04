import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sowlab_auth/auth/user_interface/Signup/page1/signup_model.dart';

class ApiServiceClass {
  static const String _baseUrl = 'https://sowlab.com/assignment/user/register';

  Future<Map<String, dynamic>> signUp(UserModel user) async {
    var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));

    request.fields['full_name'] = user.fullName;
    request.fields['email'] = user.email;
    request.fields['phone'] = user.phone;
    request.fields['password'] = user.password;

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return jsonDecode(responseData);
    } else {
      throw Exception('Failed to sign up: ${response.statusCode}');
    }
  }
}