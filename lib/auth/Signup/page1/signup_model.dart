// models/user_model.dart

import 'dart:convert';

class UserModel {
  final String fullName;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
  });
}

