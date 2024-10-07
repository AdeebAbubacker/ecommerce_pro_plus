import 'product.dart';

class SearchProductsModel {
	List<Product>? products;
	int? total;
	int? skip;
	int? limit;

	SearchProductsModel({this.products, this.total, this.skip, this.limit});

	factory SearchProductsModel.fromJson(Map<String, dynamic> json) {
		return SearchProductsModel(
			products: (json['products'] as List<dynamic>?)
						?.map((e) => Product.fromJson(e as Map<String, dynamic>))
						.toList(),
			total: json['total'] as int?,
			skip: json['skip'] as int?,
			limit: json['limit'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'products': products?.map((e) => e.toJson()).toList(),
				'total': total,
				'skip': skip,
				'limit': limit,
			};
}
