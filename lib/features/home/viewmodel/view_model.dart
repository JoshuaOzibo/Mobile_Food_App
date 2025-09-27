import 'package:mobile_food_app/networks/api_request.dart';

class FetchHomeData {

  String catchError = '';



  Future<Map<String, dynamic>?> fetchData({required String letter}) async {
    try {
      final api = ApiRequest(
        url: 'https://www.themealdb.com/api/json/v1/1/search.php?f=$letter',
      );
      final foodData = await api.getFood();
      if (foodData != null &&
          foodData.isNotEmpty &&
          foodData['meals'] != null) {
        print('success fetching food data');
      }
      if(foodData['meals'] == null){
        catchError = 'No food found for $letter';
      }
      return foodData;
    } catch (e) {
      print('error fetching food data by letter: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> fetchFoodByName({required String name}) async {
    try {
      final api = ApiRequest(
        url: 'https://www.themealdb.com/api/json/v1/1/search.php?s=$name',
      );
      final foodData = await api.getFood();
      if (foodData != null &&
          foodData.isNotEmpty &&
          foodData['meals'] != null) {
        print('success fetching food data by name');
      }
      
      return foodData;
    } catch (e) {
      print('error fetching food by name $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> searchFoodByCategory({
    required String category,
  }) async {
    try {
      final api = ApiRequest(
        url: 'https://www.themealdb.com/api/json/v1/1/search.php?s=$category',
      );
      final searchFood = await api.getFood();
      if ( searchFood != null) {
        print('food search successfully');
      }
      if(searchFood['meals'] == null){
        catchError = 'No food found for $category';
      }
      return searchFood;
    } catch (e) {
      print('error searching food by category');
      print(e);
      return null;
    }
  }
}
