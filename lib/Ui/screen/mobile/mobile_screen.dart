// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:ecommerce/Ui/screen/mobile/widgets/promotional_banner.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/search_button.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/signup.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/social_media.dart';
import 'package:ecommerce/Ui/widgets/dropdown_button.dart';
import 'package:ecommerce/core/view_model/categorySearch/category_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  CategoryItem? selectedArmedForces =
      CategoryItem(displayName: "All", id: "1", slug: "all");

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<CategorySearchBloc>(context)
          .add(const CategorySearchEvent.categorySearch(query: "All"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const SearchButton(),
            const SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Select Category",
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 88, 88, 88),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                DropdownButtons(
                  categoryItems: [
                    CategoryItem(displayName: 'All', id: '1', slug: 'All'),
                    CategoryItem(
                        displayName: 'Beauty', id: '2', slug: 'beauty'),
                    CategoryItem(
                        displayName: 'Fragrances', id: '3', slug: 'fragrances'),
                    CategoryItem(
                        displayName: 'Furniture', id: '4', slug: 'furniture'),
                    CategoryItem(
                        displayName: 'Groceries', id: '5', slug: 'groceries'),
                    CategoryItem(
                        displayName: 'Home Decoration',
                        id: '6',
                        slug: 'home-decoration'),
                    CategoryItem(
                        displayName: 'Kitchen Accessories',
                        id: '7',
                        slug: 'kitchen-accessories'),
                    CategoryItem(
                        displayName: 'Laptops', id: '8', slug: 'laptops'),
                    CategoryItem(
                        displayName: 'Mens Shirts',
                        id: '9',
                        slug: 'mens-shirts'),
                    CategoryItem(
                        displayName: 'Mens Shoes',
                        id: '10',
                        slug: 'mens-shoes'),
                    CategoryItem(
                        displayName: 'Mens Watches',
                        id: '11',
                        slug: 'mens-watches'),
                    CategoryItem(
                        displayName: 'Mobile Accessories',
                        id: '12',
                        slug: 'mobile-accessories'),
                    CategoryItem(
                        displayName: 'Motorcycle',
                        id: '13',
                        slug: 'motorcycle'),
                    CategoryItem(
                        displayName: 'Skin Care', id: '14', slug: 'skin-care'),
                    CategoryItem(
                        displayName: 'Smartphones',
                        id: '15',
                        slug: 'smartphones'),
                    CategoryItem(
                        displayName: 'Sports Accessories',
                        id: '16',
                        slug: 'sports-accessories'),
                    CategoryItem(
                        displayName: 'Sunglasses',
                        id: '17',
                        slug: 'sunglasses'),
                    CategoryItem(
                        displayName: 'Tablets', id: '18', slug: 'tablets'),
                    CategoryItem(displayName: 'Tops', id: '19', slug: 'tops'),
                    CategoryItem(
                        displayName: 'Vehicle', id: '20', slug: 'vehicle'),
                    CategoryItem(
                        displayName: 'Womens Bags',
                        id: '21',
                        slug: 'womens-bags'),
                    CategoryItem(
                        displayName: 'Womens Dresses',
                        id: '22',
                        slug: 'womens-dresses'),
                    CategoryItem(
                        displayName: 'Womens Jewellery',
                        id: '23',
                        slug: 'womens-jewellery'),
                    CategoryItem(
                        displayName: 'Womens Shoes',
                        id: '24',
                        slug: 'womens-shoes'),
                    CategoryItem(
                        displayName: 'Womens Watches',
                        id: '25',
                        slug: 'womens-watches'),
                  ],
                  onClassChanged: (CategoryItem? selectedItem) {
                    selectedArmedForces = selectedItem;
                    print(selectedArmedForces?.displayName);
                    BlocProvider.of<CategorySearchBloc>(context).add(
                        CategorySearchEvent.categorySearch(
                            query: selectedArmedForces!.slug));
                  },
                  hinttext: 'Select Category',
                ),
              ],
            ),
            const SizedBox(height: 30),
            const PromotionalBanner(),
            const SizedBox(height: 20),
            BlocBuilder<CategorySearchBloc, CategorySearchState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return const Text("Error");
                  },
                  failure: (value) {
                    return const Text("Error");
                  },
                  initial: (value) {
                    return const Text("Error");
                  },
                  success: (value) {
                    // Ensure total is not null
                    int totalItems = value.categorySearch.total ??
                        0; // Use a default value of 0 if null
                    int itemsPerPage = 6;
                    int totalPages = (totalItems / itemsPerPage)
                        .ceil(); // Calculate total pages
                    print('totalpage ${totalPages}');
                    return GridView.builder(
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Adjust the number of columns as needed
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 6 / 12,
                      ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 390,

                          // Adjust the margin as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 190,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              10), // Adjust the radius as needed
                                          topRight: Radius.circular(9),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(
                                              10), // Match the container's radius
                                          topRight: Radius.circular(9),
                                        ),
                                        child: Image.asset(
                                          'assets/image-1.jpg',
                                          height: 190,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:
                                          8, // Adjust the distance from the top
                                      right:
                                          8, // Adjust the distance from the right
                                      child: Container(
                                          color: const Color.fromARGB(
                                              44, 255, 255, 255),
                                          child: const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.favorite_border),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nike Air Jordan',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 88, 88, 88),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Product Description: Lorem Ipsum, some text comes here...',
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 138, 138, 138),
                                        fontSize: 10,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      '\$120.23',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 10,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  loading: (value) {
                    return const CircularProgressIndicator(); // Show loading indicator
                  },
                );
              },
            ),
            const SizedBox(height: 40),
            const SocialMedia(),
            const SizedBox(height: 20),
            const Signup(),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
