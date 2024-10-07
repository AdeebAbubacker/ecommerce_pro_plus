// ignore_for_file: collection_methods_unrelated_type

import 'package:ecommerce/core/models/food_model/food_model.dart';
import 'package:ecommerce/core/models/search_products_model/product.dart';
import 'package:ecommerce/core/models/search_products_model/search_products_model.dart';
import 'package:ecommerce/core/view_model/searchproducts/search_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// SearchDelegate for handling search
class ProductSearchDelegate extends SearchDelegate {
  List<SearchProductsModel> suggestionsList = []; // Holds search suggestions
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
            return _buildListView(products, context);
          },
          loading: (value) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Filter the suggestions based on the search query
    final suggestions = suggestionsList.where((product) {
      return product.products?.any((p) =>
              p.brand!.toLowerCase().contains(query.toLowerCase()) ||
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
          ),
          title: Text(product.brand!),
          subtitle: Text(product.category!),
          onTap: () {
            query = product.brand!; // Set query to the selected product brand
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
        // Ensure there are products in the list before accessing them
        if (list[index].category!.isEmpty) {
          return const SizedBox(); // Return an empty box if no products
        }

        return ListTile(
          leading: Image.network(
            list[index].thumbnail.toString() ??
                "https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/thumbnail.png", // Ensure valid path
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(
            list[index].brand!.toString(),
          ),
          subtitle: Text(list[index].category!.toString()),
          trailing: IconButton(
            icon: const Icon(Icons.close, color: Colors.red),
            onPressed: () {
              // Remove the suggestion from the list
              suggestionsList.remove(list[index]);
              query = ''; // Clear the search query
              showSuggestions(context);
            },
          ),
          onTap: () {
            // Ensure foodList is defined and valid
            if (foodList.isNotEmpty) {
              query = foodList[index].food; // Assuming this is the correct item
              showResults(context);
            }
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
