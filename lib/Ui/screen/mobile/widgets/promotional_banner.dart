import 'package:flutter/material.dart';

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
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title Text",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "Slash Sales begins in April. Get up to 80 % Discount on all products Read More",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}


