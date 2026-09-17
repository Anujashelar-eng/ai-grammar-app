import 'package:ai_grammer_app/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 16, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(241, 241, 244, 1),
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/Grammar.jpg",
                      // height: 150,
                      // width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: -10,
                  top: -10,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      shape: BoxShape.circle,
                    ),

                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/images.jpg",
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Welcome to",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "AI GrammerSence",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Check Grammer Every Words & Sentences",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(125, 124, 130, 1),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(106, 83, 231, 1),
                ),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
