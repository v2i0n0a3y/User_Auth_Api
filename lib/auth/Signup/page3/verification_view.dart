import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sowlab_auth/auth/Signup/page3/verification_view_model.dart';

import '../page4/businesshours.dart';


class VerificationPageView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final TextEditingController businessNameController;
  final TextEditingController informalNameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController zipcodeController;
  final String? selectedState;

  const VerificationPageView({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.businessNameController,
    required this.informalNameController,
    required this.addressController,
    required this.cityController,
    required this.zipcodeController,
    required this.selectedState,
    required this.rePasswordController ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VerificationViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FarmerEats",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Signup 3 of 4",
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Verification",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Attach proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic",
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.3),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Attach proof of registration",
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD56C60),
                          shape: BoxShape.circle,
                        ),
                        child: Consumer<VerificationViewModel>(
                          builder: (context, viewModel, _) => IconButton(
                            onPressed: () => viewModel.pickFile(context),
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Consumer<VerificationViewModel>(
                    builder: (context, viewModel, _) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.black.withOpacity(.2),
                        height: 50,
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                viewModel.model.fileName ?? "File Not Selected",
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black),
                              onPressed: viewModel.removeFile,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 280),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD56C60),
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessHour()));
                          },
                          child: Text(
                            "Continue",
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
