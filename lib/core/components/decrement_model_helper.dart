import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';

class DecrementModelHelper {
  final Box<DatabaseProductClass> hiveStorage = Hive.box('cart');

  void updateModelHelper({index, getItem}) {
    final update = DatabaseProductClass(
      id: getItem.id,
      name: getItem.name,
      category: getItem.category,
      area: getItem.area,
      instructions: getItem.instructions,
      thumbnail: getItem.thumbnail,
      ingredients: getItem.ingredients,
      measures: getItem.measures,
      quantity: getItem.quantity - 1,
      rating: getItem.rating,
      price: getItem.price,
    );
    hiveStorage.putAt(index, update);
  }
}
