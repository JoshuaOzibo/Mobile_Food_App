import 'package:flutter/material.dart';
import 'package:mobile_food_app/features/favorite/component/favorite_class.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  final double deliveryFee = 1.50;

  void addProduct(Map<String, dynamic> product) {
   final exists = cart.any((item) => item['index'] == product['index']);
   if(!exists){
    cart.add(product);
    notifyListeners();
   }else{
    print('item exist');
    return;
   }
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
    final index = cart.indexWhere((index) => index['index'] == product['index']);
    cart[index]['quantity'] += 1;
    notifyListeners();
  }

  void decrement(product) {
    final index = cart.indexWhere((index) => index['index'] == product['index']);
    if (product['quantity'] == 1) {
      cart.removeAt(index);
    } else {
      cart[index]['quantity'] -= 1;
    }

    notifyListeners();
  }
}

class FavoriteItemProvider extends ChangeNotifier {
    List<FavoriteClass> favoriteList = [];

    // void addProduct(Map<String, dynamic> product){
    //   cart.add(product);
    // }

  void addFavorite( FavoriteClass product) {
    favoriteList.add(product);
    notifyListeners();
  }
}

class NotificationProvider extends ChangeNotifier {
  List<String> notification = ["Hello", "app"];
}
