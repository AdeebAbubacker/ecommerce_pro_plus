// ignore_for_file: collection_methods_unrelated_type

import 'package:ecommerce/core/models/food_model/food_model.dart';
import 'package:ecommerce/core/models/search_products_model/product.dart';
import 'package:ecommerce/core/models/search_products_model/search_products_model.dart';
import 'package:ecommerce/core/view_model/searchproducts/search_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// SearchDelegate for handling search
// class ProductSearchDelegate extends SearchDelegate {
//  List<SearchProductsModel> suggestionsList = [
//     SearchProductsModel(
//       products: [
//         Product(
//           title: 'Apple',
//           category: 'Electronics',
//           images: ['https://cdn.dummyjson.com/products/1/thumbnail.jpg'],
//         ),
//         Product(
//           title: 'Samsung',
//           category: 'Electronics',
//           images: ['https://cdn.dummyjson.com/products/2/thumbnail.jpg'],
//         ),
//       ],
//     ),
//     SearchProductsModel(
//       products: [
//         Product(
//           title: 'Nike',
//           category: 'Fashion',
//           images: ['https://cdn.dummyjson.com/products/3/thumbnail.jpg'],
//         ),
//         Product(
//           title: 'Adidas',
//           category: 'Fashion',
//           images: ['https://cdn.dummyjson.com/products/4/thumbnail.jpg'],
//         ),
//       ],
//     ),
//   ];
//   List<FoodModel> foodList = []; // Assume this is your list of food items

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       appBarTheme: const AppBarTheme(
//         color: Colors.white,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       scaffoldBackgroundColor: Colors.white,
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = ''; // Clear the search query
//           showSuggestions(context);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null); // Close the search and return null
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final bloc = _getSearchProductsBloc(context);

//     // Dispatch the search event when the query changes
//     bloc.add(SearchProductsEvent.searchProducts(keyword: query));

//     return BlocBuilder<SearchProductsBloc, SearchProductsState>(
//       bloc: bloc,
//       builder: (context, state) {
//         return state.maybeMap(
//           orElse: () => const Center(child: Text('Error')),
//           failure: (value) => const Center(child: Text('Error')),
//           initial: (value) => const Center(child: Text('No results found')),
//           success: (value) {
//             final products = value.getProducts.products ?? [];
//             return _buildListView(products, context);
//           },
//           loading: (value) => const Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // Filter the suggestions based on the search query
//     final suggestions = suggestionsList.where((product) {
//       return product.products?.any((p) =>
//               p.title!.toLowerCase().contains(query.toLowerCase()) ||
//               p.category!.toLowerCase().contains(query.toLowerCase())) ??
//           false;
//     }).toList();

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final product = suggestions[index]
//             .products!
//             .first; // Get the first product as a suggestion
//         return ListTile(
//           leading: Image.network(
//             product.images![0].toString(),
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//           ),
//           title: Text(product.title!),
//           subtitle: Text(product.category!),
//           onTap: () {
//             query = product.title!; // Set query to the selected product title
//             showResults(context); // Show results for the selected suggestion
//           },
//         );
//       },
//     );
//   }

//   Widget _buildListView(List<Product> list, BuildContext context) {
//     return ListView.builder(
//       itemCount: list.length,
//       itemBuilder: (context, index) {
//         // Ensure there are products in the list before accessing them
//         if (list[index].category!.isEmpty) {
//           return const SizedBox(); // Return an empty box if no products
//         }

//         return ListTile(
//           leading: Image.network(
//             list[index].thumbnail.toString() ??
//                 "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/thumbnail.png", // Ensure valid path
//             width: 50,
//             height: 50,
//             fit: BoxFit.cover,
//           ),
//           title: Text(
//             list[index].title!.toString(),
//           ),
//           subtitle: Text(list[index].category!.toString()),
//           trailing: IconButton(
//             icon: const Icon(Icons.close, color: Colors.red),
//             onPressed: () {
//               // Remove the suggestion from the list
//               suggestionsList.remove(list[index]);
//               query = ''; // Clear the search query
//               showSuggestions(context);
//             },
//           ),
//           onTap: () {
//             // Ensure foodList is defined and valid
//             if (foodList.isNotEmpty) {
//               query = foodList[index].food; // Assuming this is the correct item
//               showResults(context);
//             }
//           },
//         );
//       },
//     );
//   }

//   // Access the SearchProductsBloc instance from the current context
//   SearchProductsBloc _getSearchProductsBloc(BuildContext context) {
//     return BlocProvider.of<SearchProductsBloc>(context);
//   }
// }

// ignore_for_file: collection_methods_unrelated_type

import 'package:ecommerce/core/models/food_model/food_model.dart';
import 'package:ecommerce/core/models/search_products_model/product.dart';
import 'package:ecommerce/core/models/search_products_model/search_products_model.dart';
import 'package:ecommerce/core/view_model/searchproducts/search_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// SearchDelegate for handling search
class ProductSearchDelegate extends SearchDelegate {
  List<SearchProductsModel> suggestionsList = [
    // Static suggestions
    SearchProductsModel(
      products: [
        Product(
          title: 'Apple',
          category: 'Electronics',
          images: [
            'https://cdn.dummyjson.com/products/images/groceries/Apple/thumbnail.png'
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Comfort Trends',
          category: 'footwear',
          images: [
            'https://cdn.dummyjson.com/products/images/womens-shoes/Black%20&%20Brown%20Slipper/thumbnail.png'
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Calvin Klein',
          category: 'Heel shoes',
          images: [
            'https://cdn.dummyjson.com/products/images/womens-shoes/Calvin%20Klein%20Heel%20Shoes/thumbnail.png'
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Fashion Diva',
          category: "women's shoes",
          images: [
            'https://cdn.dummyjson.com/products/images/womens-shoes/Golden%20Shoes%20Woman/thumbnail.png'
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Sunflower Oil',
          category: "Food",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Cooking%20Oil/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'pet supplies',
          category: "Dog Food",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Dog%20Food/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Eggs',
          category: "groceries",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Eggs/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Fish Steak',
          category: "seafood",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Fish%20Steak/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Green Bell Pepper',
          category: "groceries",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Green%20Bell%20Pepper/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Green Chili Pepper',
          category: "groceries",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Green%20Chili%20Pepper/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Honey Jar',
          category: "groceries",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Honey%20Jar/thumbnail.png"
          ],
        ),
      ],
    ),
    SearchProductsModel(
      products: [
        Product(
          title: 'Ice Cream',
          category: "groceries",
          images: [
            "https://cdn.dummyjson.com/products/images/groceries/Ice%20Cream/thumbnail.png"
          ],
        ),
      ],
    ),
  ];

  List<FoodModel> foodList = []; // Assume this is your list of food items

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search and return null
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final bloc = _getSearchProductsBloc(context);

    // Dispatch the search event when the query changes
    bloc.add(SearchProductsEvent.searchProducts(keyword: query));

    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      bloc: bloc,
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const Center(child: Text('Error')),
          failure: (value) => const Center(child: Text('Error')),
          initial: (value) => const Center(child: Text('No results found')),
          success: (value) {
            final products = value.getProducts.products ?? [];
            // Check if the list is null or empty
            if (products == null || products.isEmpty) {
              return const Center(child: Text("Item Not Available"));
            }
            return _buildListView(products, context);
          },
          loading: (value) => const Center(child: CircularProgressIndicator()),
          noInternet: (value) {
            return Text("No Internt Please Try again");
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the suggestions based on the search query
    final suggestions = suggestionsList.where((product) {
      return product.products?.any((p) =>
              p.title!.toLowerCase().contains(query.toLowerCase()) ||
              p.category!.toLowerCase().contains(query.toLowerCase())) ??
          false;
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index]
            .products!
            .first; // Get the first product as a suggestion
        return ListTile(
          leading: Image.network(
            product.images![0].toString(),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 30,
              );
            },
          ),
          title: Text(product.title!),
          subtitle: Text(product.category!),
          onTap: () {
            query = product.title!; // Set query to the selected product title
            showResults(context); // Show results for the selected suggestion
          },
        );
      },
    );
  }

  Widget _buildListView(List<Product> list, BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final product = list[index];

        // Check if category, title, or thumbnail is null
        if (product.category?.isEmpty ?? true) {
          return const SizedBox(); // Return an empty box if category is null or empty
        }

        // return ListTile(
        //   leading: Image.network(
        //     // Use a fallback image if thumbnail is null or empty
        //     product.thumbnail ??
        //         "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/thumbnail.png",
        //     width: 50,
        //     height: 50,
        //     fit: BoxFit.cover,
        //     errorBuilder: (context, error, stackTrace) {
        //       return Icon(
        //         Icons.error_outline,
        //         color: Colors.red,
        //         size: 30,
        //       );
        //     },
        //   ),
        //   title: Text(
        //     product.title ??
        //         'Unknown title', // Use a fallback text if title is null
        //   ),
        //   subtitle: Text(
        //     product.category ??
        //         'Unknown Category', // Use a fallback text if category is null
        //   ),
        //   trailing: IconButton(
        //     icon: const Icon(Icons.close, color: Colors.red),
        //     onPressed: () {
        //       // Remove the suggestion from the list
        //       suggestionsList.remove(product);
        //       query = ''; // Clear the search query
        //       showSuggestions(context);
        //     },
        //   ),
        //   onTap: () {
        //     // Ensure foodList is defined and valid
        //     if (foodList.isNotEmpty) {
        //       query = foodList[index].food; // Assuming this is the correct item
        //       showResults(context);
        //     }
        //   },
        // );
        return ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: Image.network(
              // Use a fallback image if thumbnail is null or empty
              product.thumbnail ??
                  "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/thumbnail.png",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 30,
                  ),
                );
              },
            ),
          ),
          title: Text(
            product.title ?? "Unknown Brand",
          ),
          subtitle: Text(product.category ?? "No Category"),
          trailing: IconButton(
            icon: Icon(Icons.close, color: Colors.red),
            onPressed: () {
              // Handle close action
            },
          ),
          onTap: () {
            // Handle on tap action
          },
        );
      },
    );
  }

  // Access the SearchProductsBloc instance from the current context
  SearchProductsBloc _getSearchProductsBloc(BuildContext context) {
    return BlocProvider.of<SearchProductsBloc>(context);
  }
}
