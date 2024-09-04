import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

class VerifyOtp extends StatefulWidget {
  final String phoneNumber;
  const VerifyOtp({super.key, required this.phoneNumber});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {

  String _otp = '';
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  void _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    final success = await _apiService.verifyOtp(widget.phoneNumber, _otp);

    setState(() {
      _isLoading = false;
    });

    if (success) {
      // Navigate to the next screen or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP Verified Successfully!')),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify OTP.')),
      );
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
                Text("FarmerEats",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 70,),
                Text("Verify OTP",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: (){

                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Remember your password? ',
                            style: GoogleFonts.beVietnamPro(
                                color: Colors.black.withOpacity(.3),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)
                        ),
                        TextSpan(
                            text: 'Login ',
                            style: GoogleFonts.beVietnamPro(
                                color: Color(0xFFD56C60),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OTPTextField(
                        otpFieldStyle: OtpFieldStyle(
                          focusBorderColor: Colors.black.withOpacity(.7),
                          backgroundColor: Colors.black.withOpacity(.2)
                        ),
                        length: 6, // Set your OTP length
                        width: 400,
                        fieldWidth: 50,
                        style: GoogleFonts.beVietnamPro(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                        fieldStyle: FieldStyle.box,
                        onChanged: (pin) {
                          print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          setState(() {
                            _otp = pin;
                          });
                          print("Completed: " + pin);
                        },
                      ),
                    ),
                 ],
                ),
                SizedBox(height: 20,),
                _isLoading ? Center(child: CircularProgressIndicator(),):

                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD56C60)
                      ),
                      onPressed: (){
                        _otp.length == 6 ? _verifyOtp : null;
                      },
                      child: Text("Submit", style: GoogleFonts.beVietnamPro(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    setState(() {
                      _otp.length == 6 ? _verifyOtp : null;
                    });
                  },
                  child: Center(child: Text("Resend Code",
                    style: GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.underline),

                  )
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

class ApiService {
  final String baseUrl = 'https://your-api-endpoint.com'; // Replace with your API URL

  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    final url = Uri.parse('$baseUrl/verify-otp'); // Replace with your API endpoint

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phone_number': phoneNumber,
        'otp': otp,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['success']; // Adjust according to your API response
    } else {
      print('Failed to verify OTP: ${response.statusCode}');
      return false;
    }
  }
}