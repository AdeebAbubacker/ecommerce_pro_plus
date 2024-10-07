import 'package:flutter/material.dart';

class MiscTest extends StatelessWidget {
  const MiscTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/thumbnail.png')
          ],
        ),
      ),
    );
  }
}
