import 'dart:convert';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;
  final double rating;
  final String brand;
  final String? color;
  final String? connectivity;
  final bool? wireless;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
    required this.brand,
    this.color,
    this.connectivity,
    this.wireless,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    String? image,
    double? rating,
    String? brand,
    String? color,
    String? connectivity,
    bool? wireless,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        image: image ?? this.image,
        rating: rating ?? this.rating,
        brand: brand ?? this.brand,
        color: color ?? this.color,
        connectivity: connectivity ?? this.connectivity,
        wireless: wireless ?? this.wireless,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"]?.toDouble(),
    image: json["image"],
    rating: json["rating"]?.toDouble(),
    brand: json["brand"],
    color: json["color"],
    connectivity: json["connectivity"],
    wireless: json["wireless"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": image,
    "rating": rating,
    "brand": brand,
    "color": color,
    "connectivity": connectivity,
    "wireless": wireless,
  };
}
