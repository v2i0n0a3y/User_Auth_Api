// views/signup_view.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sowlab_auth/auth/user_interface/Login/login_design.dart';
import 'package:sowlab_auth/auth/user_interface/Signup/page1/signup_viewmodel.dart';
import 'package:sowlab_auth/auth/user_interface/Signup/page2/farm_info_view.dart';
import '../../farminfo.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Consumer<SignUpViewModel>(
                builder: (context, viewModel, child) {
                  return Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "FarmerEats",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.beVietnamPro(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          "signup 1 of 4",
                          style: GoogleFonts.beVietnamPro(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(.3)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Welcome!",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.beVietnamPro(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        SocialMediaButtons(),
                        const SizedBox(height: 30),
                        _buildTextField(
                          controller: viewModel.nameController,
                          hintText: "Full Name",
                          prefixIcon: Icons.person_2_outlined,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: viewModel.emailController,
                          hintText: "Email Address",
                          prefixIcon: Icons.alternate_email,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: viewModel.phoneController,
                          hintText: "Phone Number",
                          prefixIcon: Icons.phone_rounded,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: viewModel.passwordController,
                          hintText: "Password",
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: viewModel.rePasswordController,
                          hintText: "Re-enter Password",
                          prefixIcon: Icons.lock_outline_rounded,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginDesignForm()),
                                );
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD56C60)),
                                onPressed: viewModel.isLoading
                                    ? null
                                    : () async {
                                  await viewModel.signUp();
                                  if (!viewModel.isLoading) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FarmInfoView(
                                          rePasswordController: viewModel.rePasswordController,
                                          nameController: viewModel.nameController,
                                          emailController: viewModel.emailController,
                                          phoneController: viewModel.phoneController,
                                          passwordController: viewModel.passwordController,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: viewModel.isLoading
                                    ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                    : Text(
                                  "Continue",
                                  style: GoogleFonts.beVietnamPro(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
  }) {
    return SizedBox(
      height: 50,
      width: 400,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: GoogleFonts.beVietnamPro(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black54,
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.black.withOpacity(0.2),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60,
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialMediaButton(assetName: 'images/google.png'),
          SocialMediaButton(assetName: 'images/apple.png'),
          SocialMediaButton(assetName: 'images/facebook.png'),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String assetName;

  const SocialMediaButton({required this.assetName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 85,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: null,
        ),
        onPressed: () {},
        child: Image.asset(assetName),
      ),
    );
  }
}
