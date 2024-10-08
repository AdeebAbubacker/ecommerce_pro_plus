// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/Ui/screen/mobile/screens/mobile_screen.dart';
import 'package:ecommerce/core/db/hive_db/adapters/category_adater/category_adapter.dart';
import 'package:ecommerce/core/db/hive_db/boxes/category_box.dart';
import 'package:ecommerce/core/view_model/productCategory/productscategory_bloc.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
     WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<ProductscategoryBloc>(context)
          .add(const ProductscategoryEvent.getProductsCategory());
    });
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..forward();

    // Create fade, scale, and rotation animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _rotationAnimation = Tween<double>(begin: -0.05, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductscategoryBloc, ProductscategoryState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          failure: (value) {},
          initial: (value) {},
          loading: (value) {},
          success: (value) async {
            for (var i = 0; i < value.getProducts.length; i++) {
              await CategoryBox.put(
                i,
                CategoryDB(
                  name: value.getProducts[i].name, // Store name
                  slug: value.getProducts[i].slug.toString(), // Store slug
                ),
              );
            } // Now let's print the contents of the Hive box
            print("Stored categories in Hive DB:");

            for (var i = 0; i < CategoryBox.length; i++) {
              final category = CategoryBox.get(i);
              print(
                  'Category $i: Name - ${category?.name}, Slug - ${category?.slug}');
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const MyHomePage();
            },));
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: RichText(
                          text: TextSpan(
                            children: _buildModernAnimatedText(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildModernAnimatedText() {
    final List<String> textParts = ['M', 'oBo', 'om', 'B'];
    final List<Color> textColors = [
      Colors.pink,
      Colors.black,
      Colors.black,
      Colors.pink
    ];

    return List<TextSpan>.generate(textParts.length, (int index) {
      return TextSpan(
        text: textParts[index],
        style: GoogleFonts.poppins(
          fontSize: 48, // Consistent font size
          fontWeight: FontWeight.bold,
          color: textColors[index],
        ),
      );
    });
  }
}
