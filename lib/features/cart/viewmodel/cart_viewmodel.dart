import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/models/product_class.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductClass> _cart = [];
  final double deliveryFee = 1.50;
  List<ProductClass> get getCartItems => _cart;

  final Box<DatabaseProductClass>? cartBox;

  CartViewmodel({this.cartBox}){
    loadCart();
  }

  void loadCart() {
   if(cartBox != null){
     final dbProducts = cartBox!.values.toList();
    _cart.clear();
    for (var dbProduct in dbProducts) {
      _cart.add(dbProduct.toProduct());
    notifyListeners();
    }
   }
  }

  void addToCartFunc(meal) {
    final dbProduct = DatabaseProductClass.fromProduct(meal);
    cartBox!.add(dbProduct);
    _cart.add(meal);
    notifyListeners();
  }

  void removeFromCartFunc(ProductClass meal) {
    _cart.remove(meal);
    notifyListeners();
  }

  // get price
  double get getSubTotal {
    final subtotalPrice = _cart.fold(
      0.0,
      (previousValue, element) =>
          previousValue + (element.price! * element.quantity!),
    );
    return double.parse(subtotalPrice.toString());
  }

  double get totalShopping {
    if (_cart.isEmpty) return 0.0;
    final total = getSubTotal + deliveryFee;
    return total;
  }

  void incrementQuantity(ProductClass product) {
    final findIndex = _cart.indexWhere((item) => item.id == product.id);
    final currentQty = _cart[findIndex].quantity ?? 1;
    _cart[findIndex].quantity = currentQty + 1;
    notifyListeners();
  }

  void decrementQuantity(ProductClass product) {
    final findIndex = _cart.indexWhere((item) => item.id == product.id);
    final getSingleFoodQty = _cart[findIndex].quantity;
    if (getSingleFoodQty == 1) {
      _cart.remove(product);
    } else {
      final currentQty = _cart[findIndex].quantity ?? 1;
      _cart[findIndex].quantity = currentQty - 1;
    }
    notifyListeners();
  }
}
