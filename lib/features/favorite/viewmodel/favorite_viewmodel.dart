import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:mobile_food_app/models/product_class.dart';

class FavoriteViewmodel extends ChangeNotifier {
  final List<ProductClass> _favoriteList = [];
  List<ProductClass> get getFavList => _favoriteList;
  final Box<DatabaseProductClass> favoriteBox = Hive.box('favorite');
  final Box<DatabaseProductClass> cartBox = Hive.box('cart');
  CartViewmodel cartItem = CartViewmodel();

  void loadFavorite() {
    _favoriteList.clear();
    for (var favorite in favoriteBox.values.toList()) {
      _favoriteList.add(favorite.toProduct());
    }
    notifyListeners();
  }

  void addToFavorite(ProductClass meal) {
    final toDbModel = DatabaseProductClass.fromProduct(meal);
    favoriteBox.add(toDbModel);
    _favoriteList.add(meal);
    notifyListeners();
  }

  void removeFromFavorite(ProductClass meal) {
    final index = favoriteBox.values.toList().indexWhere(
      (item) => item.id == meal.id,
    );
    if (index != -1) {
      favoriteBox.deleteAt(index);
      _favoriteList.remove(meal);
    }
    notifyListeners();
  }

  void addToCart(ProductClass meal) {
    final toDbModel = DatabaseProductClass.fromProduct(meal);
    final exist = cartItem.getCartItems.any((item) => item.id == meal.id);
    if (!exist) {
      cartBox.add(toDbModel);
    }
    notifyListeners();
  }
}
