import 'dart:convert';
import 'package:http/http.dart' ;

class WeatherService {
  final String apiKey = '420a499d5ab7b1967ee06f5fcee69580';
  final String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>?> fetchWeather(String city) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Failed to load weather data');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
