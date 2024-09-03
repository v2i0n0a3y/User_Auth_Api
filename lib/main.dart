import 'package:flutter/material.dart';
import 'package:sowlab_auth/auth/user_interface/verification.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:sowlab_auth/onboarding/onboarding.dart';

import 'auth/signin.dart';
import 'auth/signup.dart';
import 'auth/user_interface/ApplicationForm.dart';
import 'auth/user_interface/all_done.dart';
import 'auth/user_interface/businesshours.dart';
import 'auth/user_interface/forget.dart';
import 'auth/user_interface/forminfo.dart';
import 'auth/user_interface/login.dart';
import 'auth/user_interface/resetPassword.dart';
import 'auth/user_interface/signup.dart';
import 'auth/user_interface/verifyotp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //textTheme:GoogleFonts.poppinsTextTheme(),

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true,
      ),
      home: Onbording()
      // FarmInfo(
      //   nameController: TextEditingController(),
      //   emailController: TextEditingController(),
      //   phoneController: TextEditingController(),
      //   passwordController: TextEditingController(),
      //   rePasswordController: TextEditingController(),
      // )
    );
  }
}



