import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
                mainAxisSize: MainAxisSize.min,
                children: [       const Row(
                children: [
                  Text("SOCIALS"),
                  Spacer(),
                  Text("PLATFORMS"),
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
                  const Icon(FontAwesomeIcons.android),
                  const SizedBox(width: 10),
                  const Icon(FontAwesomeIcons.apple)
                ],
              )
            ],);
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