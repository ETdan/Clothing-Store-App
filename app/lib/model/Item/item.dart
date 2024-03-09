
class Item {
  final String imagePath;
  final String name;
  final String brand;
  final double price;
  final String description;
  double rating;
  int review;
  final List<int> sizes;
  bool isFavoraite;

  Item(
      {required this.imagePath,
      required this.name,
      required this.brand,
      required this.price,
      required this.description,
      required this.rating,
      required this.review,
      required this.sizes,
      required this.isFavoraite});

// Incase we use LocalStorage(Shared Preference)
// Serialize the Item object to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'name': name,
      'brand': brand,
      'price': price,
      'description': description,
      'rating': rating,
      'review': review,
      'sizes': sizes,
      'isFavoraite': isFavoraite,
    };
  }

  // Deserialize JSON map to Item object
  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        imagePath: json['imagePath'],
        name: json['name'],
        brand: json['brand'],
        price: json['price'],
        description: json['description'],
        rating: json['rating'],
        review: json['review'],
        sizes: json['sizes'],
        isFavoraite: json['isFavoraite']);
  }
}
