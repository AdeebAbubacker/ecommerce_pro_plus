import 'package:ecommerce/Ui/screen/mobile/widgets/promotional_banner.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/search_button.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/signup.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/social_media.dart';
import 'package:ecommerce/Ui/widgets/dropdown_button.dart';
import 'package:ecommerce/Ui/widgets/search_delegate.dart';
import 'package:ecommerce/core/view_model/categorySearch/category_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileScreen extends StatefulWidget {
  MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  CategoryItem? selectedArmedForces =
      CategoryItem(displayName: "All", id: "1", slug: "all");

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const SearchButton(),
            const SizedBox(height: 10),
            Row(
              children: [
                Text("Select Category"),
                Spacer(),
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
            const SizedBox(height: 10),
            const PromotionalBanner(),
            const Text("data"),
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
                    return SizedBox(
                      width: 300,
                      height: 490, // Adjust height to fit your design
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              300 / 3, // Smaller width for each item
                          crossAxisSpacing: 10, // Adjust spacing as needed
                          mainAxisSpacing: 10, // Adjust spacing as needed
                          childAspectRatio: 1, // Maintain a square aspect ratio
                        ),
                        itemCount: value.categorySearch.products?.length,
                        itemBuilder: (context, index) {
                          final product = value.categorySearch.products?[index];
                          return Container(
                            width: 100, // Fixed width for the container
                            height: 100, // Fixed height for the container
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Colors
                                  .white, // Background color of the container
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product!.title
                                        .toString(), // Display product name
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14, // Adjust size as needed
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Prevent overflow
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  loading: (value) {
                    return const CircularProgressIndicator(); // Show loading indicator
                  },
                );
              },
            ),
            const SocialMedia(),
            const Signup(),
          ],
        ),
      ),
    );
  }
}
