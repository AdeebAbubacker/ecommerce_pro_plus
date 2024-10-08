import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/Ui/screen/mobile/screens/mobile_screen.dart';
import 'package:ecommerce/Ui/screen/mobile/screens/splash_screen.dart';
import 'package:ecommerce/Ui/screen/web/web_screen.dart';
import 'package:ecommerce/core/db/hive_db/adapters/category_adater/category_adapter.dart';
import 'package:ecommerce/core/db/hive_db/boxes/category_box.dart';
import 'package:ecommerce/core/view_model/categorySearch/category_search_bloc.dart';
import 'package:ecommerce/core/view_model/productCategory/productscategory_bloc.dart';
import 'package:ecommerce/core/view_model/searchproducts/search_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  ///-------------Register Adapter----------------------------------
  Hive.registerAdapter(CategoryDBAdapter());
  CategoryBox = await Hive.openBox<CategoryDB>('CategoryBox');

  ///----------------lock in portrait mode-----------------------------------
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
      runApp(const MyApp());
// runApp(
//     DevicePreview(
//       enabled: true,
//       tools: const [
//         ...DevicePreview.defaultTools,

//       ],
//       builder: (context) => const MyApp(),
//     ),
// );
    // runApp(MyApp());
  });
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
        home: const SplashScreen(),
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
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/menu (5).svg",
                width: 12, // Adjust the width as per your design
                height: 12, // Adjust the height as per your design
              ),
            ),
            backgroundColor: Colors.white, // Set AppBar color to white
            foregroundColor: Colors.black, // Icon and text color
            title: Image.asset(
              "assets/Moboom.jpg",
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
