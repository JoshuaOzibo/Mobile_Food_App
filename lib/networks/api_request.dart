import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRequest {
  String url;
  ApiRequest({required this.url});
  Future getFood() async {
    try {
      final res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
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
