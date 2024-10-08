import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Color.fromARGB(255, 127, 64, 60),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title Text",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text:
                    "Slash Sales begins in April. Get up to 80 % Discount on all products ", 
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(
                    text: "Read More", 
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
