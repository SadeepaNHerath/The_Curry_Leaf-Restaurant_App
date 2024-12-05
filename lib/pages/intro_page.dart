import 'package:curry_leaf/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 39, 184, 50),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Text(
                "THE CURRY LEAF",
                textAlign: TextAlign.start,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: screenWidth * 0.07,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: screenWidth * 0.6,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "THE TASTE OF SRI LANKAN FOOD",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: screenWidth * 0.09,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Experience the flavors of Sri Lanka's most beloved dishes, anytime and anywhere.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[300],
                  height: 1.5,
                  fontSize: screenWidth * 0.04,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              MyButton(
                text: "Get Started",
                onTap: () {
                  Navigator.pushNamed(context, '/menu-page');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
