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
          width: double.infinity, 
          height: 50,
          child: ElevatedButton(
            onPressed: () {
            
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black, 
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0), 
              ),
            ),
            child: const Text(
              'SUBSCRIBE',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white, 
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: RichText(
            textAlign: TextAlign.center, 
            text: const TextSpan(
              text:
                  'By Clicking the SUBSCRIBE button, you are agreeing to our ',
              style: TextStyle(
                color: Colors.grey, 
              ),
              children: [
                TextSpan(
                  text: 'privacy & Cookie Policy',
                  style: TextStyle(
                    color: Colors.blue,
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
            alignment: WrapAlignment.center, 
            spacing: 5.0,
            children: [
              Text(
                "Privacy Center",
                style: TextStyle(
                  color: Colors.grey, 
                  decoration: TextDecoration.underline, 
                  decorationColor: Colors.grey, 
                ),
              ),
              Text(
                "Privacy & Cookie Policy",
                style: TextStyle(
                  color: Colors.grey, 
                  decoration: TextDecoration.underline, 
                  decorationColor: Colors.grey, 
                ),
              ),
              Text(
                "Manage Cookies",
                style: TextStyle(
                  color: Colors.grey, 
                  decoration: TextDecoration.underline, 
                  decorationColor: Colors.grey, 
                ),
              ),
              Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: Colors.grey, 
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey,
                ),
              ),
              Text(
                "Copyright Notice",
                style: TextStyle(
                  color: Colors.grey, 
                  decoration: TextDecoration.underline, 
                  decorationColor: Colors.grey, 
                ),
              ),
              Text(
                "Imprint",
                style: TextStyle(
                  color: Colors.grey, 
                  decoration: TextDecoration.underline, 
                  decorationColor: Colors.grey, 
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
