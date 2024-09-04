import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../page5/all_done.dart';

class BusinessHour extends StatefulWidget {

  const BusinessHour({super.key,});

  @override
  State<BusinessHour> createState() => _BusinessHourState();
}

class _BusinessHourState extends State<BusinessHour> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController informalNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();

  late final String? selectedState;


  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      String url = 'sowlab.com/assignment/user/register'; // Replace with your API endpoint

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields['full_name'] = nameController.text;
      request.fields['email'] = emailController.text;
      request.fields['phone'] = phoneController.text;
      request.fields['password'] = passwordController.text;
      request.fields['business_name'] = businessNameController.text;
      request.fields['informal_name'] = informalNameController.text;
      request.fields['address'] = addressController.text;
      request.fields['city'] = cityController.text;
      request.fields['state'] = selectedState.toString();
      request.fields['zip_code'] = zipcodeController.text;

      // Adding Business Hours as JSON string
      request.fields['business_hours'] = jsonEncode({
        "mon": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "tue": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "wed": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
        "thu": ["8:00am - 10:00am", "10:00am - 1:00pm", "1:00pm - 4:00pm"],
        "fri": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "sat": ["8:00am - 10:00am", "10:00am - 1:00pm"],
        "sun": ["8:00am - 10:00am"]
      });

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
                        border: Border.all(
                        color: Colors.black.withOpacity(.3), // Border color
                        width: 1.0, // Border width
                      ),
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(
                        onPressed: (){},
                        icon: Text("Th", style: GoogleFonts.beVietnamPro(fontSize: 14, fontWeight: FontWeight.w500),),),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(.3), // Border color
                            width: 1.0, // Border width
                          ),
                          color: Colors.white,
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
                          border: Border.all(
                            color: Colors.black.withOpacity(.3), // Border color
                            width: 1.0, // Border width
                          ),
                          color: Colors.white,
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
                          border: Border.all(
                            color: Colors.black.withOpacity(.3), // Border color
                            width: 1.0, // Border width
                          ),
                          color: Colors.white,
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
                        onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back)),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD56C60)
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AllDone()));

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
