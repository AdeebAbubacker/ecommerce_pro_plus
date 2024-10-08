import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              "SOCIALS",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            Text(
              "PLATFORMS",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the icons
          children: [
            _buildSocialIcon(FontAwesomeIcons.facebookF),
            const SizedBox(width: 10),
            _buildSocialIcon(FontAwesomeIcons.twitter),
            const SizedBox(width: 10),
            _buildSocialIcon(FontAwesomeIcons.instagram),
            const SizedBox(width: 10),
            _buildSocialIcon(FontAwesomeIcons.tiktok),
            const SizedBox(width: 10),
            _buildSocialIcon(Icons.notifications),
            Spacer(),
            SvgPicture.asset(
              "assets/android.svg",
              width: 25, // Adjust the width as per your design
              height: 25, // Adjust the height as per your design
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              "assets/apple.svg",
              width: 25, // Adjust the width as per your design
              height: 25, // Adjust the height as per your design
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Padding around the icon
      decoration: const BoxDecoration(
        shape: BoxShape.circle, // Makes the container circular
        color: Colors.black, // Background color (black)
      ),
      child: Icon(
        icon,
        color: Colors.white, // Icon color (white)
        size: 13.0, // Icon size
      ),
    );
  }
}
