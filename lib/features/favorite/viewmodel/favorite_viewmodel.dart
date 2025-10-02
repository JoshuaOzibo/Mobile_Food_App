import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobile_food_app/features/cart/databaseType/db_product_class.dart';
import 'package:mobile_food_app/features/cart/viewmodel/cart_viewmodel.dart';
import 'package:mobile_food_app/models/product_class.dart';

class FavoriteViewmodel extends ChangeNotifier {
  final List<ProductClass> _favoriteList = [];
  List<ProductClass> get getFavList => [];
  final Box<DatabaseProductClass> favoriteItem ;
  // final Box<DatabaseProductClass> cartBox;
  late CartViewmodel _cartViewmodel;

  FavoriteViewmodel({required this.favoriteItem,}){
    // _cartViewmodel = CartViewmodel(cartBox: cartBox);
  }

  void loadFavorite(){
      for(var favorite in favoriteItem.values.toList()){
      _favoriteList.add(favorite.toProduct());
      }
      notifyListeners();

  }

  void addToFavorite(ProductClass meal) {
    final convertToUiType = DatabaseProductClass.fromProduct(meal);
    favoriteItem.add(convertToUiType);
    _favoriteList.add(meal);
    notifyListeners();
  }

  void removeFromFavorite(ProductClass meal) {
    final convertToUiType = DatabaseProductClass.fromProduct(meal);
    favoriteItem.delete(convertToUiType);
    _favoriteList.remove(meal);
    notifyListeners();
  }

  void addToCart(ProductClass meal) {
    _cartViewmodel.addToCartFunc(meal);
    notifyListeners();
  }
}
