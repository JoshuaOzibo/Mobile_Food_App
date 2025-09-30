import 'package:mobile_food_app/models/product_class.dart';
import 'package:mobile_food_app/networks/api_request.dart';

class HomePageRepository {
  Future<List<ProductClass>> fetchFoodWithLetter(letter) async {
    final api = ApiRequest(
      url: 'https://www.themealdb.com/api/json/v1/1/search.php?f=$letter',
    );
    try {
      final apiResponse = await api.getFood();
      if (apiResponse['meals'] == null) {
        return [];
      }

      return (apiResponse['meals'] as List)
          .map((item) => ProductClass.fromJson(item))
          .toList();
    } catch (e) {
      print('error from repository $e');
      throw Exception('Faild to fetch food : $e');
    }
  }

  Future<List<ProductClass>> fetchByFoodName(name) async {
    final api = ApiRequest(
      url: 'https://www.themealdb.com/api/json/v1/1/search.php?s=$name',
    );
    try {
      final apiResponse = await api.getFood();
      if (apiResponse['meals'] == null) {
        return [];
      }

      return (apiResponse['meals'] as List)
          .map((item) => ProductClass.fromJson(item))
          .toList();
    } catch (e) {
      print(e);
      throw Exception('failed to fetch food with name');
    }
  }

  Future<List<ProductClass>> searchFoodByCategory(category) async {
    final api = ApiRequest(
      url: 'https://www.themealdb.com/api/json/v1/1/search.php?s=$category',
    );
    try {
      final apiResponse = await api.getFood();
      if (apiResponse['meals'] == null) {
        return [];
      }

      return (apiResponse['meals'] as List)
          .map((item) => ProductClass.fromJson(item))
          .toList();
    } catch (e) {
      print(e);
      throw Exception('error fetching food for this categoty $category');
    }
  }
}
