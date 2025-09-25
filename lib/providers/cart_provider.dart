import 'package:flutter/material.dart';
import 'package:mobile_food_app/models/favorite_class.dart';
import 'package:mobile_food_app/models/product_class.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductClass> cart = [];
  final double deliveryFee = 1.50;

  void addProduct(ProductClass product) {
   final exists = cart.any((item) => item.index == product.index);
   if(!exists){
    cart.add(product);
    print(product);
    notifyListeners();
   }else{
    print('item exist');
    return;
   }
  }

  void removeProduct(ProductClass product) {
    cart.remove(product);
    product.quantity = 1;
    notifyListeners();
  }

  double get subTotal {
    final subtotalPrice = cart.fold(
      0.0,
      (prev, element) => prev + (element.price * element.quantity),
    );
    return double.parse(subtotalPrice.toStringAsFixed(2));
  }

  double get total {
    if (cart.isEmpty) return 0.0;
    final total = subTotal + deliveryFee;
    return double.parse(total.toStringAsFixed(2));
  }

  void increment(ProductClass product) {
    final index = cart.indexWhere((index) => index.index == product.index);
    cart[index].quantity += 1;
    notifyListeners();
  }

  void decrement( ProductClass product) {
    final index = cart.indexWhere((index) => index.index == product.index);
    if (product.quantity == 1) {
      cart.removeAt(index);
    } else {
      cart[index].quantity -= 1;
    }

    notifyListeners();
  }
}

class FavoriteItemProvider extends ChangeNotifier {
    final CartProvider cartProvider = CartProvider();
    List<FavoriteClass> favoriteList = [];

    void addProduct( product){
      cartProvider.addProduct(product);
      notifyListeners();
    }

  void addFavorite( FavoriteClass product) {
    favoriteList.add(product);
    notifyListeners();
  }

  void removeFavorite( FavoriteClass product) {
    favoriteList.remove(product);
    notifyListeners();
  }

}

class NotificationProvider extends ChangeNotifier {
  List<String> notification = ["Hello", "app"];
}
