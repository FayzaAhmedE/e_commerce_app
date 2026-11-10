class ProductModel {
  final int id;
   String title;
   double price;
   String description;
   String category;
   String image;
   RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: jsonData['price'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData['rating'] != null 
          ? RatingModel.fromJson(jsonData['rating']) 
          : null,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] ?? 0).toDouble(),
      count: (jsonData['count'] ?? 0).toInt(),
    );
  }
}
