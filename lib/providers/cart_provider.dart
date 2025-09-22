import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  final List<Map<String, dynamic>> favoriteList = [];
  final double totalPrice = 0;
  double formattedPrice = 0;

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    var total = cart.fold(
      totalPrice,
      (previousValue, element) => previousValue + element['price'],
    );
    formattedPrice = double.parse(total.toStringAsFixed(2));
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
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
