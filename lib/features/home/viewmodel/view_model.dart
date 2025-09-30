import 'package:flutter/material.dart';
import 'package:mobile_food_app/features/home/repositories/home_page_repository.dart';
import 'package:mobile_food_app/features/home/screen/index.dart';
import 'package:mobile_food_app/models/product_class.dart';
import 'package:mobile_food_app/networks/api_request.dart';

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

  Future<void> fetchByName(name) async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try{
      final fetchedMealByName = await repository.fetchByFoodName(name);
      _products = fetchedMealByName;
      if(fetchedMealByName.isEmpty){
        errorMessage = 'No meals found for name $name';
      }
    }catch(e){
      _products = [];
      print(e);
      isLoading = false;
      throw Exception('Error fetching food by name');
    }
  }

  Future<void> searchFoodCategory(category) async{
    isLoading = true;
    errorMessage = null;
    try{
      final searchedMeal = await repository.searchFoodByCategory(category);
      _products = searchedMeal;
      if(searchedMeal.isEmpty){
        errorMessage = 'No meals found for category $category';
      }

    }catch(e){
      _products = [];
      isLoading = false;
      print(e);
      throw Exception('Error searching for food $e');
    }
  }
}

// import 'package:mobile_food_app/networks/api_request.dart';

// class FetchHomeData {
//   Future<Map<String, dynamic>?> fetchData({required String letter}) async {
//     try {
//       final api = ApiRequest(
//         url: 'https://www.themealdb.com/api/json/v1/1/search.php?f=$letter',
//       );
//       final foodData = await api.getFood();
//       if (foodData != null &&
//           foodData.isNotEmpty &&
//           foodData['meals'] != null) {
//         print('success fetching food data');
//       }
//       if (foodData['meals'] == null) {
//         print('No food found for letter $letter');
//       }
//       return foodData;
//     } catch (e) {
//       print('error fetching food data by letter: $e');
//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> fetchFoodByName({required String name}) async {
//     try {
//       final api = ApiRequest(
//         url: 'https://www.themealdb.com/api/json/v1/1/search.php?s=$name',
//       );
//       final foodData = await api.getFood();
//       if (foodData != null &&
//           foodData.isNotEmpty &&
//           foodData['meals'] != null) {
//         print('success fetching food data by name');
//       }
//       return foodData;
//     } catch (e) {
//       print('error fetching food by name $e');
//       return null;
//     }
//   }

//   Future<Map<String, dynamic>?> searchFoodByCategory({
//     required String category,
//   }) async {
//     try {
//       final api = ApiRequest(
//         url: 'https://www.themealdb.com/api/json/v1/1/search.php?s=$category',
//       );
//       final searchFood = await api.getFood();
//       if (searchFood != null) {
//         print('food search successfully');
//       }
//       if (searchFood['meals'] == null) {
//         print('No food found for categoty $category');
//       }
//       return searchFood;
//     } catch (e) {
//       print('error searching food by category');
//       print(e);
//       return null;
//     }
//   }
// }
