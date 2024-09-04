import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '../auth/Login/login.dart';
import 'contain_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contents[currentIndex].background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    SvgPicture.asset(
                      contents[i].image,
                      height: 400,
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Text(
                                contents[i].title,
                                style: GoogleFonts.beVietnamPro(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  contents[i].discription,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.beVietnamPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  contents.length,
                                      (index) => buildDot(index, context),
                                ),
                              ),
                              SizedBox(height: 70),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("Join the moment!",
                                  style: GoogleFonts.beVietnamPro(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: contents[currentIndex].background,
                                  maximumSize: Size(236, 60)
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                height: 60,
                                margin: EdgeInsets.only(bottom: 50),
                                width: double.infinity,
                                child: TextButton(
                                  child: Text(
                                    currentIndex == contents.length - 1 ? "Login" : "Login" ,
                                    style: GoogleFonts.beVietnamPro(fontSize: 14,decoration: TextDecoration.underline,fontWeight: FontWeight.w500, color: Colors.black),
                                  ),
                                  onPressed: () {
                                    if (currentIndex == contents.length - 1) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LoginDesign(),
                                        ),
                                      );
                                    }
                                    _controller.nextPage(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.bounceIn,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
    );
  }
}
