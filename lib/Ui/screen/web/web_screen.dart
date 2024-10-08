import 'package:ecommerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Web Platform Currently Not vailable",
                style: TextStyles.poppins14Colorw400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
