import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  final List<Map<String, dynamic>> favoriteList = [];
  final double deliveryFee = 1.50;

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }

  double get subTotal {
    final subtotalPrice = cart.fold(
      0.0,
      (prev, element) => prev + element['price'],
    );
    return double.parse(subtotalPrice.toStringAsFixed(2));
  }

  double get total {
    if(cart.isEmpty) return 0.0;
    final total = subTotal + deliveryFee;
    return double.parse(total.toStringAsFixed(2));
  }
}

// class FavoriteItem extends CartProvider {
//   void addFavorite(product) {
//     favoriteList.add(product);
//     notifyListeners();
//   }
// }

class NotificationProvider extends ChangeNotifier {
  List<String> notification = ["Hello", "app"];
}
