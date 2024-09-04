import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sowlab_auth/auth/user_interface/Login/login_design.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _phoneController = TextEditingController();

  void _sendOtp() async {
    await sendOtp(_phoneController.text);
  }

  Future<void> sendOtp(String phoneNumber) async {
    final url = Uri.parse('https://sowlab.com/assignment/user/forgot-password'); // Replace with your API URL
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'phoneNumber': phoneNumber, // or email if using email
      }),
    );

    if (response.statusCode == 200) {
      // OTP sent successfully
      print('OTP sent successfully');
      print('Response: ${response.body}');
    } else {
      // Error occurred while sending OTP
      print('Failed to send OTP');
      print('Error: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(height: 70),
                Text(
                  "Forget Password?",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginDesignForm()));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Remember your password? ',
                          style: GoogleFonts.beVietnamPro(
                            color: Colors.black.withOpacity(.3),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: 'Login ',
                          style: GoogleFonts.beVietnamPro(
                            color: Color(0xFFD56C60),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    controller: _phoneController,
                    style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.black54,
                      ),
                      hintText: "Phone Number",
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD56C60),
                    ),
                    onPressed: () {
                      _sendOtp(); // Make sure the function is called
                    },
                    child: Text(
                      "Send Code",
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
          ),
        ),
      ),
    );
  }
}
