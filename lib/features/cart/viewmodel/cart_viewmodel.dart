import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/models/product_class.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductClass> _cart = [];
  final double deliveryFee = 1.50;
  List<ProductClass> get getCartItems => _cart;
  final Box<DatabaseProductClass> hiveCartStorage = Hive.box('cart');

  void fetchDbCart() {
    for (var hiveCart in hiveCartStorage.values.toList()) {
      _cart.add(hiveCart.toProduct());
      notifyListeners();
    }
  }

  void addToCartFunc(ProductClass meal) {
    final dbToUiModel = DatabaseProductClass.fromProduct(meal);
    hiveCartStorage.add(dbToUiModel);
    _cart.add(meal);
    notifyListeners();
  }

  void removeFromCartFunc(ProductClass meal) {
    final dbToUiModel = DatabaseProductClass.fromProduct(meal);
    final hiveStorage = hiveCartStorage.values.toList();
    final index = hiveStorage.indexWhere((item) => item.id == dbToUiModel.id);
    hiveCartStorage.deleteAt(index);
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
    // db
    final currentDatabase = hiveCartStorage.values.toList();
    final uiToDbModel = DatabaseProductClass.fromProduct(product);

   final getItemId = currentDatabase.indexWhere((item) => item.id == uiToDbModel.id);
   var currentItem = currentDatabase[getItemId];

  currentItem.quantity  = currentDatabase[getItemId].quantity + 1;


    // ui
    final findIndex = _cart.indexWhere((item) => item.id == product.id);
    final currentQty = _cart[findIndex].quantity ?? 1;
    _cart[findIndex].quantity = currentQty + 1;
    notifyListeners();
  }

  void decrementQuantity(ProductClass product) {
    // db
    final hiveStorage = hiveCartStorage.values.toList();
    for (var hiveSingleItem in hiveStorage) {
      final findIndex = hiveSingleItem.toProduct().id == product.id;
      if (hiveSingleItem.quantity == 1) {
        findIndex ? hiveSingleItem.id != product.id : hiveSingleItem;
        notifyListeners();
      }
    }
    final findDbIndex = hiveStorage.indexWhere((item) => item.id == product.id);
    final getSingleDbFoodQty = hiveStorage[findDbIndex].quantity;
    if (getSingleDbFoodQty == 1) {
      hiveStorage.removeAt(findDbIndex);
    } else {
      hiveStorage[findDbIndex].quantity - 1;
    }
    // ui
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
