import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessHour extends StatefulWidget {
  const BusinessHour({super.key});

  @override
  State<BusinessHour> createState() => _BusinessHourState();
}

class _BusinessHourState extends State<BusinessHour> {
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
                Text("Signup 4 of 4",
                  style: GoogleFonts.beVietnamPro(fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.3))
                  ,),
                SizedBox(height: 20,),

                Text("Business Hours",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 20,),
                Text("Choose the hours your farm is open for pickups. This will allow customers to order deliveries.",
                  style: GoogleFonts.beVietnamPro(fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.3))
                  ,),
                SizedBox(height: 40,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.2),
                          shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("M", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("T", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFD56C60),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("W", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFD56C60),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("TH", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFD56C60),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("F", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFD56C60),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("S", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFD56C60),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("Su", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    )

                  ],
                ),

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color:  Colors.orange,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("8:00am - 10:00am", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color:  Colors.orange,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("10:00am - 1:00pm", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),


                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color:  Colors.black.withOpacity(.2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("1:00pm - 4:00pm", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color:  Colors.black.withOpacity(.2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("4:00pm - 7:00pm", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),


                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      height: 50,
                      width: 155,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.2),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("7:00pm - 10:00pm", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),


                  ],
                ),

                SizedBox(height: 130,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: (){}, icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD56C60)
                          ),
                          onPressed: (){

                          },
                          child: Text("Submit", style: GoogleFonts.beVietnamPro(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),)),
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
