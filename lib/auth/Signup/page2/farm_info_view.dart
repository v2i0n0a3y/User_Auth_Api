// views/farm_info_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../page3/verification_view.dart';
import 'farm_info_model.dart';
import 'farmi_Viewmodel.dart';


class FarmInfoView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;

  const FarmInfoView({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.rePasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FarmInfoViewModel(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Consumer<FarmInfoViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
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
                        "signup 2 of 4",
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(.3),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Farm Info",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.beVietnamPro(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 40),
                      _buildTextField(
                        controller: viewModel.businessNameController,
                        hintText: "Business Name",
                        prefixIcon: Icons.drive_file_rename_outline,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: viewModel.informalNameController,
                        hintText: "Informal Name",
                        prefixIcon: Icons.insert_emoticon,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: viewModel.addressController,
                        hintText: "Street Address",
                        prefixIcon: Icons.home_outlined,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: viewModel.cityController,
                        hintText: "City",
                        prefixIcon: Icons.location_on_outlined,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField<String>(
                                hint: Text(
                                  "State",
                                  style: GoogleFonts.beVietnamPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(.3),
                                  ),
                                ),
                                value: viewModel.selectedState,
                                decoration: InputDecoration(
                                  hintText: "State",
                                  filled: true,
                                  fillColor: Colors.black.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                items: viewModel.states.map((state) {
                                  return DropdownMenuItem<String>(
                                    value: state,
                                    child: Text("$state",style: TextStyle(fontSize: 3),),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  viewModel.setSelectedState(value);
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              flex: 3,
                              child: _buildTextField(
                                controller: viewModel.zipcodeController,
                                hintText: "Enter Zipcode",
                                prefixIcon: Icons.numbers_outlined,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFD56C60),
                              ),
                              onPressed: () {
                                FarmInfoModel farmInfo = viewModel.getFarmInfo();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerificationPageView(
                                      nameController: nameController,
                                      emailController: emailController,
                                      phoneController: phoneController,
                                      passwordController: passwordController,
                                      businessNameController: viewModel.businessNameController,
                                      informalNameController: viewModel.informalNameController,
                                      addressController: viewModel.addressController,
                                      cityController: viewModel.cityController,
                                      zipcodeController: viewModel.zipcodeController,
                                      selectedState: viewModel.selectedState,
                                      rePasswordController: rePasswordController,
                                    ),
                                  ),
                                );
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
  }) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        controller: controller,
        style: GoogleFonts.beVietnamPro(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
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
