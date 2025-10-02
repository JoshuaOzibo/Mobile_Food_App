import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/core/components/decrement_model_helper.dart';
import 'package:mobile_food_app/core/components/increment_model_helper.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/models/product_class.dart';

class CartViewmodel extends ChangeNotifier {
  final List<ProductClass> _cart = [];
  final double deliveryFee = 1.50;
  List<ProductClass> get getCartItems => _cart;
  final Box<DatabaseProductClass> hiveCartStorage = Hive.box('cart');
  final incrementHelperFunc = IncrementModelHelper();
  final decrementHelperFunc = DecrementModelHelper();

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
    final indexOfSingleItem = hiveCartStorage.values.toList().indexWhere(
      (item) => item.id == product.id,
    );
    if (indexOfSingleItem != -1) {
      // get the dbIndexOfThatItem
      final getItem = hiveCartStorage.getAt(indexOfSingleItem);
      incrementHelperFunc.updateModelHelper(
        index: indexOfSingleItem,
        getItem: getItem,
      );
    }

    // ui
    final findIndex = _cart.indexWhere((item) => item.id == product.id);
    final currentQty = _cart[findIndex].quantity ?? 1;
    _cart[findIndex].quantity = currentQty + 1;
    notifyListeners();
  }

  void decrementQuantity(ProductClass product) {
    // db
    final itemIndex = hiveCartStorage.values.toList().indexWhere(
      (item) => item.id == product.id,
    );

    // get singleItem
    final dbItem = hiveCartStorage.getAt(itemIndex);
    if (dbItem!.quantity == 1) {
      hiveCartStorage.deleteAt(itemIndex);
    } else {
      decrementHelperFunc.updateModelHelper(index: itemIndex, getItem: dbItem);
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
