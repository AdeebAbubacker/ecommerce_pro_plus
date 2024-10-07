class FoodModel {
  final String img;
  final String deatiledImg;
  final String food;
  final String shop;
  final String price;
  final String? details;
  final String? timing;
  final String rating;
  const FoodModel({
    required this.img,
    required this.deatiledImg,
    required this.food,
    required this.shop,
    required this.price,
    this.details = '',
    this.timing = '30 - 35',
    required this.rating,
  });
}