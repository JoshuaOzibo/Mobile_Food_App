import 'package:flutter/widgets.dart';
import 'package:mobile_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:mobile_food_app/models/product_class.dart';

class FavoriteViewmodel extends ChangeNotifier {
  final List<ProductClass> _favoriteList = [];
  List<ProductClass> get getFavList => [];

  final CartViewmodel _cartViewmodel = CartViewmodel();

  void addToFavorite(ProductClass meal) {
    _favoriteList.add(meal);
  }

  void removeFromFavorite(ProductClass meal) {
    _favoriteList.add(meal);
  }

  void addToCart(ProductClass meal) {
    _cartViewmodel.addToCartFunc(meal);
  }
}
