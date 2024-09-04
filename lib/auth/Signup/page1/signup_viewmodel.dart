import 'package:flutter/material.dart';
import 'package:sowlab_auth/auth/Signup/page1/signup_model.dart';
import 'api_service.dart';


class SignUpViewModel extends ChangeNotifier {
  final ApiServiceClass _apiService = ApiServiceClass();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      UserModel user = UserModel(
        fullName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
      );

      try {
        await _apiService.signUp(user);
        // Handle success
      } catch (e) {
        // Handle error
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
