import 'package:ecommerce/Ui/screen/mobile/mobile_screen.dart';
import 'package:ecommerce/Ui/screen/web/web_screen.dart';
import 'package:ecommerce/core/view_model/categorySearch/category_search_bloc.dart';
import 'package:ecommerce/core/view_model/productCategory/productscategory_bloc.dart';
import 'package:ecommerce/core/view_model/searchproducts/search_products_bloc.dart';
import 'package:ecommerce/test/list_allProducts_testing.dart';
import 'package:ecommerce/test/product_category_screen.dart';
import 'package:ecommerce/test/seach_category-screen.dart';
import 'package:ecommerce/test/search_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategorySearchBloc(),
        ),
        BlocProvider(
          create: (context) => ProductscategoryBloc(),
        ),
        BlocProvider(
          create: (context) => SearchProductsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0), // Set your custom height
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Pure white background
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Subtle shadow color
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3), // Small shadow below the AppBar
              ),
            ],
          ),
          child: AppBar(
            leading: Image.asset(
              "assets/menu_icon.png",
              width: 4,
              height: 4,
            ),
            backgroundColor: Colors.white, // Set AppBar color to white
            foregroundColor: Colors.black, // Icon and text color
            title: Image.asset(
              "assets/moboom_logo.png",
              width: 170,
            ),
            centerTitle: true,
            elevation:
                0, // Disable default elevation to avoid losing pure white

            scrolledUnderElevation: 0,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile Layout
            return MobileScreen();
          } else {
            // Web/Desktop Layout
            return const WebScreen();
          }
        },
      ),
    );
  }
}
