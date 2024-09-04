import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sowlab_auth/auth/user_interface/login.dart';
import 'farminfo.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      String url = 'sowlab.com/assignment/user/register'; // Replace with your API endpoint

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['full_name'] = nameController.text;
      request.fields['email'] = emailController.text;
      request.fields['phone'] = phoneController.text;
      request.fields['password'] = passwordController.text;

      try {
        var response = await request.send();

        if (response.statusCode == 200) {
          var responseData = await response.stream.bytesToString();
          var result = jsonDecode(responseData);
          // Handle success
          print('Sign Up Successful: $result');
        } else {
          // Handle failure
          print('Failed to sign up: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
      }
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
                SizedBox(height: 50,),
                Text("signup 1 of 4",
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(.3)),
                ),
                SizedBox(height: 10,),

                Text("Welcome!",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),

                SizedBox(height: 20,),
                SizedBox(
                  height: 60,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 85,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: null

                            ),
                            onPressed: (){},
                            child: Image.asset('images/google.png')),
                      ),
                      SizedBox(
                        height: 50,
                        width: 85,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: null

                            ),
                            onPressed: (){},
                            child: Image.asset('images/apple.png')),
                      ),
                      SizedBox(
                        height: 50,
                        width: 85,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: null

                            ),
                            onPressed: (){},
                            child: Image.asset('images/facebook.png')),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),

                InkWell(
                  onTap: (){

                  },
                  child: Center(
                      child: Text("or signup with",
                        style: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(.3)),
                      )
                  )
                ),
                SizedBox(height: 30,),

                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    controller: nameController,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_2_outlined, color: Colors.black54,),
                      hintText: "Full Name",
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
                    controller: emailController,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email, color: Colors.black54,),
                      hintText: "Email Address",
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
                    controller: phoneController,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_rounded, color: Colors.black54,),
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
                SizedBox(height: 20,),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.black54,),
                      hintText: "Password",
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
                  child: TextField(
                    controller: passwordController,
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded, color: Colors.black54,),
                      hintText: "Re-enter Password",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginDesign()));
                      },
                        child: Text("Login",
                          style: GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,),)),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD56C60)
                          ),
                          onPressed: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FarmInfo(
                                  rePasswordController: passwordController,
                                  nameController: nameController,
                                  emailController: emailController,
                                  phoneController: phoneController,
                                  passwordController: passwordController,
                                ),
                              ),
                            );

                          },
                          child: Text("Continue", style: GoogleFonts.beVietnamPro(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
