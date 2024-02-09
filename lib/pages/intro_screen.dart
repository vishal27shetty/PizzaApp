import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromRGBO(250, 141, 62, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text(
                'THE PIZZA HOUSE',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSerifText(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                top: 10,
                bottom: 5,
              ),
              child: Image.asset('lib/images/pizza.png'),
            ),

            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "SLICE BY SLICE WE TURN MOMENTS INTO MEMORIES",
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSerifText(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Experience Italy's finest flavors in every bite at our pizzeria.",
              style: TextStyle(
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 24),

            const Spacer(),

            // get started button
            GestureDetector(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 24, bottom: 24, left: 150, right: 150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Color.fromRGBO(255, 187, 138, 0.8),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

