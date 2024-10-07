import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("SIGN UP"),
        SizedBox(height: 5),
        TextFormField(
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity, // Maximum width
          child: ElevatedButton(
            onPressed: () {
              // Handle subscribe action here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, // Black background color
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0), // Button height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rectangular shape
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
        Center(
          child: RichText(
            textAlign: TextAlign.center, // Align the text to the center
            text: TextSpan(
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
        Center(
          child: Text("©️2010-2022 All Rights Reserved"),
        ),
        Wrap(
          spacing: 10.0, // Space between items in the wrap
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
        )
      ],
    );
  }
}
