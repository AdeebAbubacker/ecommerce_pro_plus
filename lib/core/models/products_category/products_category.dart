class ProductsCategory {
	String? slug;
	String? name;
	String? url;

	ProductsCategory({this.slug, this.name, this.url});

	factory ProductsCategory.fromJson(Map<String, dynamic> json) {
		return ProductsCategory(
			slug: json['slug'] as String?,
			name: json['name'] as String?,
			url: json['url'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'slug': slug,
				'name': name,
				'url': url,
			};
}
