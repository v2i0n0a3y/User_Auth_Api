import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllDone extends StatefulWidget {
  const AllDone({super.key});

  @override
  State<AllDone> createState() => _AllDoneState();
}

class _AllDoneState extends State<AllDone> {
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

                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Image.asset("images/check.png",),
                  ),
                ),

                Text("You’re all done!",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 20,),
                Text("Hang tight!  We are currently reviewing your account and will"
                    " follow up with you in 2-3 business days."
                    " In the meantime, you can setup your inventory.",
                  style: GoogleFonts.beVietnamPro(fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.3))
                  ,),
                SizedBox(height: 60,),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD56C60)
                      ),
                      onPressed: (){

                      },
                      child: Text("Got it", style: GoogleFonts.beVietnamPro(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
