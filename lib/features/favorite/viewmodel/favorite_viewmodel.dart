import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/models/product_class.dart';

class FavoriteViewmodel extends ChangeNotifier {
  final List<ProductClass> _favoriteList = [];
  List<ProductClass> get getFavList => [];
  final Box<DatabaseProductClass> favoriteBox = Hive.box('favorite');

  void loadFavorite() {
    for(var favorite in favoriteBox.values.toList()){
    _favoriteList.add(favorite.toProduct());
    }
    notifyListeners();
  }

  void addToFavorite(ProductClass meal) {
    final toDbModel = DatabaseProductClass.fromProduct(meal);
    favoriteBox.values.toList().add(toDbModel);
    _favoriteList.add(meal);
    // print(_favoriteList);
    // print(favoriteBox.values);
    notifyListeners();
  }

  void removeFromFavorite(ProductClass meal) {
    final index = favoriteBox.values.toList().indexWhere((item) => item.id == meal.id);
    favoriteBox.deleteAt(index);
    _favoriteList.remove(meal);
    notifyListeners();
  }

  void addToCart(ProductClass meal) {
    notifyListeners();
  }
}
