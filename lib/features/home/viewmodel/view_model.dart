import 'package:flutter/material.dart';
import 'package:mobile_food_app/features/home/repositories/home_page_repository.dart';
import 'package:mobile_food_app/models/product_class.dart';

class HomeViewModel extends ChangeNotifier {
  final HomePageRepository repository;
  HomeViewModel({required this.repository});
  List<ProductClass> _products = [];

  // getters to get items
  List<ProductClass> get getProducts => _products;

  // states
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchProducts(letter) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final fetchedMeals = await repository.fetchFoodWithLetter(letter);
      _products = fetchedMeals;
      if (fetchedMeals.isEmpty) {
        errorMessage = 'No meals found for $letter';
      }
    } catch (e) {
      _products = [];
      errorMessage = 'error fetching food data by letter: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchByName(String name) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final fetchedMeals = await repository.fetchByFoodName(name);
      _products = fetchedMeals;
      if (fetchedMeals.isEmpty) {
        errorMessage = 'No meals found for $name';
      }
    } catch (e) {
      _products = [];
      errorMessage = 'error fetching food data by letter: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchFoodCategory(category) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final searchedMeal = await repository.searchFoodByCategory(category);
      _products = searchedMeal;
      if (searchedMeal.isEmpty) {
        errorMessage = 'No meals found for category $category';
      }
    } catch (e) {
      _products = [];
      errorMessage = 'error fetching food data by letter: ${e.toString()}';
      print(e);
      throw Exception('Error searching for food $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}