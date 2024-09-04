import 'package:flutter/material.dart';

class FormFieldModel {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPasswordField;

  FormFieldModel({
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.isPasswordField = false,
  });
}
