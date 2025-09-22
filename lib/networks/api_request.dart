import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRequest {
  Future<Map<String, dynamic>?> getFood() async {
    try {
      final res = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=Migas'));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        print(data);
        return data;
      } else {
        print("Request failed with status code ${res.statusCode}");
        return null;
      }
    } catch (e) {
      print('Error fetching food: $e');
      return null;
    }
  }
}
