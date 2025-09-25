import 'package:mobile_food_app/networks/api_request.dart';

class FetchHomeData {
  Future<Map<String, dynamic>?> fetchData({required String letter}) async {
    try {
      final api = ApiRequest(
        url: 'https://www.themealdb.com/api/json/v1/1/search.php?f=$letter',
      );
      final foodData = await api.getFood();
      if(foodData){
        print('success fetching food data');
      }
      return foodData;
    } catch (e) {
      print('error fetching food data $e');
      return null;
    }
  }
}
