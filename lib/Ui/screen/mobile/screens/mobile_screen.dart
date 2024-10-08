// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:ecommerce/Ui/screen/mobile/widgets/promotional_banner.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/search_button.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/signup.dart';
import 'package:ecommerce/Ui/screen/mobile/widgets/social_media.dart';
import 'package:ecommerce/Ui/widgets/dropdown_button.dart';
import 'package:ecommerce/core/const/text_style.dart';
import 'package:ecommerce/core/db/hive_db/adapters/category_adater/category_adapter.dart';
import 'package:ecommerce/core/db/hive_db/boxes/category_box.dart';
import 'package:ecommerce/core/view_model/categorySearch/category_search_bloc.dart';
import 'package:ecommerce/core/view_model/productCategory/productscategory_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shimmer/shimmer.dart';

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
      CategoryBox = await Hive.openBox<CategoryDB>('CategoryBox');
      BlocProvider.of<CategorySearchBloc>(context)
          .add(const CategorySearchEvent.categorySearch(
        query: "All",
        page: 1,
      ));
    });
  }

  int currentPage = 1; // Track the current page
  int totalPages = 1; // Track total pages
  @override
  Widget build(BuildContext context) {
    // Fetch categories from Hive database
    Future<List<CategoryDB>> _fetchCategoriesFromHive() async {
      // Fetch the values from the CategoryBox and cast them to a List<CategoryDB>
      return (CategoryBox.values.toList() as List<CategoryDB>);
    }

    return BlocListener<ProductscategoryBloc, ProductscategoryState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          failure: (value) {},
          initial: (value) {},
          loading: (value) {},
          success: (value) async {
            // for (var i = 0; i < value.getProducts.length; i++) {
            //   await CategoryBox.put(
            //     i,
            //     CategoryDB(
            //       name: value.getProducts[i].name, // Store name
            //       slug: value.getProducts[i].slug.toString(), // Store slug
            //     ),
            //   );
            // } // Now let's print the contents of the Hive box
            await CategoryBox.clear();
            // First, store the static "All" entry
            await CategoryBox.put(
              0, // index 0 for the static "All" value
              CategoryDB(
                name: "All", // Static name
                slug: "All", // Static slug or any value you'd prefer
              ),
            );

// Then, store the dynamic products
            for (var i = 0; i < value.getProducts.length; i++) {
              await CategoryBox.put(
                i + 1, // Adjust the index by adding 1 to account for the "All" entry
                CategoryDB(
                  name: value.getProducts[i].name, // Store name
                  slug: value.getProducts[i].slug.toString(), // Store slug
                ),
              );
            }

            print("Stored categories in Hive DB:");

            for (var i = 0; i < CategoryBox.length; i++) {
              final category = CategoryBox.get(i);
              print(
                  'Category $i: Name - ${category?.name}, Slug - ${category?.slug}');
            }
          },
        );
      },
      child: SingleChildScrollView(
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
                  FutureBuilder<List<CategoryDB>>(
                    future: _fetchCategoriesFromHive(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No Categories Available');
                      }

                      final categories = snapshot.data!;

                      // Convert CategoryDB to CategoryItem
                      final categoryItems = categories
                          .map((category) => CategoryItem(
                                displayName: category.name ?? 'Unknown',
                                id: category.toString(),
                                slug: category.slug ?? 'unknown',
                              ))
                          .toList();

                      return DropdownButtons(
                        categoryItems: categoryItems,
                        onClassChanged: (CategoryItem? selectedItem) {
                          selectedArmedForces = selectedItem;
                          currentPage = 1;
                          print(selectedArmedForces?.displayName);

                          BlocProvider.of<CategorySearchBloc>(context).add(
                            CategorySearchEvent.categorySearch(
                              query: selectedArmedForces!.slug,
                              page: 1,
                            ),
                          );
                        },
                        hinttext: 'All',
                      );
                    },
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
                      return Column(children: [
                        GridView.builder(
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
                          itemCount: value.categorySearch.products?.length,
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
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    10), // Match the container's radius
                                                topRight: Radius.circular(9),
                                              ),
                                              child: Image.network(
                                                '${value.categorySearch.products![index].images![0]}',
                                                height: 190,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    height: 190,
                                                    width: double.infinity,
                                                    color: Colors.grey[
                                                        200], // Background color if image fails
                                                    child: const Icon(
                                                      Icons.broken_image,
                                                      size: 50,
                                                      color: Colors
                                                          .grey, // Icon color
                                                    ),
                                                  );
                                                },
                                              )),
                                        ),
                                        Positioned(
                                          top:
                                              8, // Adjust the distance from the top
                                          right:
                                              8, // Adjust the distance from the right
                                          child: Container(
                                              color: const Color.fromARGB(
                                                  172, 199, 199, 199),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    Icon(Icons.favorite_border),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          truncateWithEllipsis(
                                              25,
                                              value.categorySearch
                                                  .products![index].title
                                                  .toString()),
                                          style: GoogleFonts.poppins(
                                            color: const Color.fromARGB(
                                                255, 88, 88, 88),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          value.categorySearch.products![index]
                                                      .description!.length >
                                                  20
                                              ? '${value.categorySearch.products![index].description.toString().substring(0, 30)}...'
                                              : value.categorySearch
                                                  .products![index].description
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                            color: const Color.fromARGB(
                                                255, 138, 138, 138),
                                            fontSize: 10,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '\$ ${value.categorySearch.products![index].price}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children:
                                              List.generate(5, (starIndex) {
                                            return Icon(
                                              Icons.star,
                                              color: starIndex <
                                                      value
                                                          .categorySearch
                                                          .products![index]
                                                          .rating!
                                                          .floor()
                                                  ? Colors
                                                      .amber // Full star (amber) for the integer part of the rating
                                                  : Colors
                                                      .grey, // Grey star for the remaining part
                                              size: 10,
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        if (totalPages > 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Previous Button
                              IconButton(
                                  onPressed: currentPage > 1
                                      ? () {
                                          setState(() {
                                            if (currentPage > 1) {
                                              currentPage--;
                                              print(
                                                  'Current page ${currentPage}');
                                              print(
                                                  'query ${selectedArmedForces?.slug}');
                                              BlocProvider.of<
                                                          CategorySearchBloc>(
                                                      context)
                                                  .add(
                                                CategorySearchEvent
                                                    .categorySearch(
                                                  query: selectedArmedForces
                                                          ?.slug ??
                                                      "All",
                                                  page: currentPage,
                                                ),
                                              );
                                            }
                                          });

                                          // Call the Bloc event with the previous page
                                          BlocProvider.of<CategorySearchBloc>(
                                                  context)
                                              .add(
                                            CategorySearchEvent.categorySearch(
                                              query:
                                                  selectedArmedForces?.slug ??
                                                      "All",
                                              page: currentPage,
                                            ),
                                          );
                                        }
                                      : null,
                                  icon: Icon(Icons.arrow_back_ios)),

                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white, // Background color
                                  border: Border.all(
                                    color: Colors.black, // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      2.0), // Optional: Rounded corners
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text('${currentPage.toString()}'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "Page $currentPage of $totalPages",
                                  style: TextStyles.poppins14Colorw400,
                                ),
                              ),

                              // Next Button
                              IconButton(
                                  onPressed: currentPage < totalPages
                                      ? () {
                                          setState(() {
                                            currentPage++;
                                            print(
                                                'Current page ${currentPage}');
                                            print(
                                                'query ${selectedArmedForces?.slug}');
                                            BlocProvider.of<CategorySearchBloc>(
                                                    context)
                                                .add(
                                              CategorySearchEvent
                                                  .categorySearch(
                                                query:
                                                    selectedArmedForces?.slug ??
                                                        "All",
                                                page: currentPage,
                                              ),
                                            );
                                          });
                                          // Call the Bloc event with the next page
                                        }
                                      : null, // Disable if on the last page
                                  icon: Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                      ]);
                    },
                    loading: (value) {
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
                        itemCount: 6, // Shimmer effect item count
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 390,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Shimmer effect for the image section
                                Shimmer.fromColors(
                                  baseColor:
                                      const Color.fromARGB(255, 238, 238, 238),
                                  highlightColor: Colors.grey.shade200,
                                  child: Container(
                                    height: 190,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 251, 251, 251),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(9),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Shimmer effect for the title
                                      Shimmer.fromColors(
                                        baseColor: const Color.fromARGB(
                                            255, 245, 244, 244),
                                        highlightColor: const Color.fromARGB(
                                            255, 245, 245, 245),
                                        child: Container(
                                          height: 12,
                                          width: 100,
                                          color: const Color.fromARGB(
                                              255, 253, 253, 253),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // Shimmer effect for the description
                                      Shimmer.fromColors(
                                        baseColor: const Color.fromARGB(
                                            255, 245, 244, 244),
                                        highlightColor: Colors.grey.shade200,
                                        child: Container(
                                          height: 10,
                                          width: 150,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      const SizedBox(height: 5),

                                      // Shimmer effect for the price
                                      Shimmer.fromColors(
                                        baseColor: const Color.fromARGB(
                                            255, 245, 244, 244),
                                        highlightColor: Colors.grey.shade200,
                                        child: Container(
                                          height: 16,
                                          width: 50,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      const SizedBox(height: 5),

                                      // Shimmer effect for the stars
                                      Row(
                                        children: List.generate(5, (starIndex) {
                                          return Shimmer.fromColors(
                                            baseColor: const Color.fromARGB(
                                                255, 245, 244, 244),
                                            highlightColor:
                                                Colors.grey.shade200,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.grey.shade300,
                                              size: 10,
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
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
      ),
    );
  }

  String truncateWithEllipsis(int cutoff, String text) {
    return (text.length <= cutoff) ? text : '${text.substring(0, cutoff)}...';
  }
}
