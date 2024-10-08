import 'dart:convert';
import 'package:ecommerce/core/models/category_search/category_search.dart';
import 'package:ecommerce/core/models/get_products_model/get_products_model.dart';
import 'package:ecommerce/core/models/products_category/products_category.dart';
import 'package:ecommerce/core/models/search_products_model/search_products_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
 // Search Products

  static Future<Either<String, SearchProductsModel>> searchProducts(
      {required String query}) async {
    final url = Uri.parse('https://dummyjson.com/products/search?q=$query');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonMap = json.decode(response.body);
      var getProducts = SearchProductsModel.fromJson(jsonMap);
      print(getProducts);
      return right(getProducts); // Return the list of products
    } else if (response.statusCode == 500) {
      var jsonMap = json.decode(response.body);
      print('500');
      print('failure ${jsonMap}');
      return left('l');
    } else {
      print('eror');
      return left('l');
    }
  }

  static Future<Either<String, List<ProductsCategory>>>
      fetchCategories() async {
    final url = Uri.parse('https://dummyjson.com/products/categories');

    final response = await http.get(url);

    print('Response body: ${response.body}'); // Debugging print

    if (response.statusCode == 200) {
      // Decode the response body as a List of maps (List<Map<String, dynamic>>)
      List<dynamic> jsonList = json.decode(response.body);

      // Convert each map into a ProductsCategory object
      List<ProductsCategory> categories = jsonList.map((item) {
        // Ensure each item is treated as Map<String, dynamic>
        return ProductsCategory.fromJson(item as Map<String, dynamic>);
      }).toList();

      print(categories); // Debugging print
      return right(categories); // Success case, return list of categories
    } else if (response.statusCode == 500) {
      return left('Server error');
    } else {
      return left('Failed to fetch categories');
    }
  }

// Fetch products by category
  // static Future<Either<String, CategorySearch>> fetchProductsByCategory(
  //     String category) async {
  //    final url = (category == "All")
  //   ? Uri.parse('https://dummyjson.com/products')
  //   : Uri.parse('https://dummyjson.com/products/category/$category');
  //   final response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     var jsonMap = json.decode(response.body);
  //     var getProducts = CategorySearch.fromJson(jsonMap);
  //     print(getProducts);
  //     return right(getProducts); // Return the list of products
  //   } else if (response.statusCode == 500) {
  //     var jsonMap = json.decode(response.body);
  //     print('500');
  //     print('failure ${jsonMap}');
  //     return left('l');
  //   } else {
  //     print('eror');
  //     return left('l');
  //   }
  // }
static Future<Either<String, CategorySearch>> fetchProductsByCategory(
    {required String category, required int page, required int limit}) async {
  final url = (category == "All")
      ? Uri.parse('https://dummyjson.com/products')
      : Uri.parse('https://dummyjson.com/products/category/$category');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonMap = json.decode(response.body);
    var getProducts = CategorySearch.fromJson(jsonMap);

    // Implementing pagination logic
    final totalProducts = getProducts.products?.length ?? 0;
    final totalPages = (totalProducts / limit).ceil(); // Total pages
    final skip = (page - 1) * limit; // Calculate skip value

    // Get the paginated products
    final paginatedProducts = getProducts.products?.skip(skip).take(limit).toList();

    // Create a new CategorySearch instance with paginated products and other values
    final paginatedResult = CategorySearch(
      products: paginatedProducts,
      total: totalProducts, // Total number of products
      skip: skip,           // Number of products skipped
      limit: limit,         // Limit of products per page
    );

    print(paginatedResult);
    return right(paginatedResult); // Return the paginated list of products
  } else if (response.statusCode == 500) {
    var jsonMap = json.decode(response.body);
    print('500');
    print('failure ${jsonMap}');
    return left('Server error');
  } else {
    print('Error: ${response.statusCode}');
    return left('Failed to fetch products');
  }
}

}
