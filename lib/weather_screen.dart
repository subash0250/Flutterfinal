import 'package:flutter/material.dart';
import 'weather_service.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic>? _weatherData;

  _getWeather() async {
    final weatherData = await _weatherService.fetchWeather(_cityController.text);
    setState(() {
      _weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 20),
            if (_weatherData != null) ...[
              Text('Temperature: ${_weatherData!['main']['temp']}°C'),
              Text('Weather: ${_weatherData!['weather'][0]['description']}'),
              Text('Humidity: ${_weatherData!['main']['humidity']}%'),
            ],
          ],
        ),
      ),
    );
  }
}
