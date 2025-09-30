
import 'package:flutter/material.dart';
import 'package:mobile_food_app/models/product_class.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductClass> _cart = [];
   List<ProductClass> get getCartItems => _cart;


  void addToCartFunc (ProductClass meal){
    _cart.add(meal);
    print(_cart);
    notifyListeners();
  }
  void removeFromCartFunc (ProductClass meal){
    _cart.remove(meal);
    notifyListeners();
  }

  // get price
   get getMealPrice => _cart;
}