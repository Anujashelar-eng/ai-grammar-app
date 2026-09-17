import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          SizedBox(height: 20),
          Text(
            "What Can I do To Help?",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(125, 124, 130, 1),
            ),
          ),
        ],
      ),
    );
  }
}
