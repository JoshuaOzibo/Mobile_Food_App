import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  final double deliveryFee = 1.50;

  void addProduct(Map<String, dynamic> product) {
    if (cart.contains(product)) {
      return;
    } else {
      cart.add(product);
    }
    notifyListeners();
  }
  

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    product['quantity'] = 1;
    notifyListeners();
  }

  double get subTotal {
    final subtotalPrice = cart.fold(
      0.0,
      (prev, element) => prev + (element['price'] * element['quantity']),
    );
    return double.parse(subtotalPrice.toStringAsFixed(2));
  }

  double get total {
    if (cart.isEmpty) return 0.0;
    final total = subTotal + deliveryFee;
    return double.parse(total.toStringAsFixed(2));
  }

  void increment(product) {
    final index = cart.indexWhere((index) => index['id'] == product['id']);
    cart[index]['quantity'] += 1;
    notifyListeners();
  }

  void decrement(product) {
    final index = cart.indexWhere((index) => index['id'] == product['id']);
    if (product['quantity'] == 1) {
      cart.removeAt(index);
    } else {
      cart[index]['quantity'] -= 1;
    }

    notifyListeners();
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
