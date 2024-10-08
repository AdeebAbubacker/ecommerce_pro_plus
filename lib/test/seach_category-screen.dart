import 'package:ecommerce/core/view_model/categorySearch/category_search_bloc.dart';
import 'package:ecommerce/core/view_model/productCategory/productscategory_bloc.dart';
import 'package:ecommerce/core/view_model/searchproducts/search_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeachCategoryscreen extends StatelessWidget {
  const SeachCategoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
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
                    width: screenWidth,
                    height: 490, // Adjust height to fit your design
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            screenWidth / 3, // Smaller width for each item
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
                                  overflow:
                                      TextOverflow.ellipsis, // Prevent overflow
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
          ElevatedButton(
            onPressed: () async {
              BlocProvider.of<CategorySearchBloc>(context)
                  .add(CategorySearchEvent.categorySearch(
                query: 'phone',
                page: 1,
              ));
            },
            child: const Text("Get Products"),
          ),
        ],
      ),
    );
  }
}
