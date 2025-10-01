import 'package:hive/hive.dart';
import 'package:mobile_food_app/models/product_class.dart';

part 'db_product_class.g.dart';

@HiveType(typeId: 0)
class DatabaseProductClass {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String area;

  @HiveField(4)
  final String instructions;

  @HiveField(5)
  final String thumbnail;

  @HiveField(6)
  final String? youtube;

  @HiveField(7)
  final List<String> ingredients;

  @HiveField(8)
  final List<String> measures;

  @HiveField(9)
  final int quantity;

  @HiveField(10)
  final double rating;

  @HiveField(11)
  final double price;

  DatabaseProductClass({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    this.youtube,
    required this.ingredients,
    required this.measures,
    required this.quantity,
    required this.rating,
    required this.price,
  });

  /// Convert from UI model → DB model
  factory DatabaseProductClass.fromProduct(ProductClass product) {
    return DatabaseProductClass(
      id: product.id,
      name: product.name,
      category: product.category,
      area: product.area,
      instructions: product.instructions,
      thumbnail: product.thumbnail,
      youtube: product.youtube,
      ingredients: product.ingredients,
      measures: product.measures,
      quantity: product.quantity ?? 1,
      rating: product.rating ?? 0.0,  
      price: product.price ?? 0.0, 
    );
  }

  /// Convert DB model → UI model
  ProductClass toProduct() {
    return ProductClass(
      id: id,
      name: name,
      category: category,
      area: area,
      instructions: instructions,
      thumbnail: thumbnail,
      youtube: youtube,
      ingredients: ingredients,
      measures: measures,
      quantity: quantity,
      rating: rating,
      price: price,
    );
  }
}
