import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationPage extends StatefulWidget {

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController businessNameController;
  final TextEditingController informalNameController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController zipcodeController;
  final String? selectedState;

  const VerificationPage({super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.businessNameController,
    required this.informalNameController,
    required this.addressController,
    required this.cityController,
    required this.zipcodeController,
    required this.selectedState,});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {

  String? _fileName;

  void _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      // Handle the selected file
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('File selected: ${result.files.single.name}')),
      // );
      //

      setState(() {
         _fileName = result.files.single.name;
      });




    } else {
      // User canceled the picker
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected')),
      );
    }
  }

  void _signUp(BuildContext context) {
    // Handle the sign-up logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign Up Successful!')),
    );
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
                Text("Signup 3 of 4",
                  style: GoogleFonts.beVietnamPro(fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.3))
                  ,),
                SizedBox(height: 20,),

                Text("Verification",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.beVietnamPro(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 20,),
              Text("Attached proof of Department of Agriculture registrations"
                  " i.e. Florida Fresh, USDA Approved, "
                  "USDA Organic",
                style: GoogleFonts.beVietnamPro(fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(.3))
                ,),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Attach proof of registration",
                      style: GoogleFonts.beVietnamPro(fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)
                      ,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD56C60),
                        shape: BoxShape.circle
                      ),
                      child: IconButton(
                          onPressed: (){
                            _pickFile(context);
                          },
                          icon: Icon(Icons.camera_alt_outlined,color: Colors.white,),),
                    )
                  ],
                ),

                SizedBox(height: 20,),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.black.withOpacity(.2),
                    height: 50,
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "$_fileName",
                            style: GoogleFonts.beVietnamPro(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.black),
                          onPressed: () {
                            setState(() {
                              _fileName = "File Not Selected"; // Reset the file name
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 280,),
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
