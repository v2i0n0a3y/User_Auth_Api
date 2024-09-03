import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:sowlab_auth/auth/user_interface/signup.dart';

import 'forget.dart';

class LoginDesign extends StatefulWidget {
  const LoginDesign({super.key});

  @override
  State<LoginDesign> createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://sowlab.com/assignment/user/login'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');

      }else {

        print('failed');
      }
    }catch(e){
      print(e.toString());
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
                Text("Welcome back!",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));

                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'New here? ',
                          style: GoogleFonts.beVietnamPro(
                              color: Colors.black.withOpacity(.3),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)
                        ),
                        TextSpan(
                            text: 'Create account ',
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
                    style:GoogleFonts.beVietnamPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.black54,),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetPassword()),
                          );
                        },
                        child: Container(
                          width: 70,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.centerRight,
                            child: Text("forget?",
                          style: GoogleFonts.beVietnamPro(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFD56C60)),
                        )
                        ),
                      ),
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD56C60)
                    ),
                      onPressed: (){
                        login(emailController.text.toString(), passwordController.text.toString());
                        },
                      child: Text("Login", style: GoogleFonts.beVietnamPro(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)),
                ),
                SizedBox(height: 20,),
                Center(child: Text("or login with",style: GoogleFonts.beVietnamPro(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.black.withOpacity(.3)),)),
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
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
