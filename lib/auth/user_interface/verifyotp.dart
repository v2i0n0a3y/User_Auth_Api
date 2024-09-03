import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(

                        style:GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(

                        style:GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(

                        style:GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(

                        style:GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(

                        style:GoogleFonts.beVietnamPro(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.2),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                 ],
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

                      },
                      child: Text("Submit", style: GoogleFonts.beVietnamPro(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: Center(child: Text("Resend Code",
                    style: GoogleFonts.beVietnamPro(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.black),


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
