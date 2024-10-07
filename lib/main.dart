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
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: const Color(0XFFFFFFFF),
        title: const Text(
          'MoBooM',
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile Layout
            return  MobileScreen();
          } else {
            // Web/Desktop Layout
            return const WebScreen();
          }
        },
      ),
    );
  }
}
