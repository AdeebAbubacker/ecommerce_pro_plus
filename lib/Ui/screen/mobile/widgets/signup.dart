import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("SIGN UP"),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Your email',
              hintStyle: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 132, 132, 132),
                fontWeight: FontWeight.w400,
              )),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity, // Maximum width
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Handle subscribe action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Black background color
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0), // Button height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0), // Rectangular shape
              ),
            ),
            child: const Text(
              'SUBSCRIBE',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, // White text color for contrast
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: RichText(
            textAlign: TextAlign.center, // Align the text to the center
            text: const TextSpan(
              text:
                  'By Clicking the SUBSCRIBE button, you are agreeing to our ',
              style: TextStyle(
                color: Colors.grey, // Set the general text to grey
              ),
              children: [
                TextSpan(
                  text: 'privacy & Cookie Policy',
                  style: TextStyle(
                    color: Colors.blue, // Set the link text to blue
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 50),
        const Center(
          child: Text("©️2010-2022 All Rights Reserved"),
        ),
        const SizedBox(height: 50),
        const Center(
          child: Wrap(
            alignment: WrapAlignment.center, // Center align the items
            spacing: 5.0, // Space between items in the wrap
            children: [
              Text(
                "Privacy Center",
                style: TextStyle(
                  color: Colors.grey, // Grey text color
                  decoration: TextDecoration.underline, // Underline
                  decorationColor: Colors.grey, // Grey underline
                ),
              ),
              Text(
                "Privacy & Cookie Policy",
                style: TextStyle(
                  color: Colors.grey, // Grey text color
                  decoration: TextDecoration.underline, // Underline
                  decorationColor: Colors.grey, // Grey underline
                ),
              ),
              Text(
                "Manage Cookies",
                style: TextStyle(
                  color: Colors.grey, // Grey text color
                  decoration: TextDecoration.underline, // Underline
                  decorationColor: Colors.grey, // Grey underline
                ),
              ),
              Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: Colors.grey, // Grey text color
                  decoration: TextDecoration.underline, // Underline
                  decorationColor: Colors.grey, // Grey underline
                ),
              ),
              Text(
                "Copyright Notice",
                style: TextStyle(
                  color: Colors.grey, // Grey text color
                  decoration: TextDecoration.underline, // Underline
                  decorationColor: Colors.grey, // Grey underline
                ),
              ),
              Text(
                "Imprint",
                style: TextStyle(
                  color: Colors.grey, // Grey text color
                  decoration: TextDecoration.underline, // Underline
                  decorationColor: Colors.grey, // Grey underline
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
