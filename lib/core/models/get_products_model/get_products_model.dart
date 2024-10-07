import 'product.dart';

class GetProductsModel {
	List<Product>? products;
	int? total;
	int? skip;
	int? limit;

	GetProductsModel({this.products, this.total, this.skip, this.limit});

	factory GetProductsModel.fromJson(Map<String, dynamic> json) {
		return GetProductsModel(
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
