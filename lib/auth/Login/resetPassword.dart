import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {


  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> resetPassword(String password, String cpassword) async {
    final response = await http.post(
      Uri.parse('https://sowlab.com/assignment/user/reset-password'),
      body: {
        'password': password,
        'cpassword': cpassword,
      },
    );

    if (response.statusCode == 200) {
      // Password reset successful, navigate to login screen
    } else {
      // Handle error
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
                Text("Reset Password",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 20,),
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
                            text: 'Login',
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

                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    controller: newPasswordController,
                    obscureText: true,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.black54,),
                      hintText: "New Password",
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.black54,),
                      hintText: "Conform New Password",
                      filled: true,
                      fillColor: Colors.black.withOpacity(.2),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD56C60)
                      ),
                      onPressed: (){
                        if (newPasswordController.text == confirmPasswordController.text) {
                          resetPassword(newPasswordController.text, confirmPasswordController.text);
                        } else {
                          print("Password not Reset");
                        }
                      },
                      child: Text("Submit",
                        style: GoogleFonts.beVietnamPro(fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),)),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
