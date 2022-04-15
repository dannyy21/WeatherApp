import 'dart:convert';
import 'package:weatherapp/Model/datamodel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherInfo> getWeather(String cityName) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    try {
      
    final queryParameters = {
      'q': cityName,
      'appid': '501831cdbb31cc3daff4ff777169cb95',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);
    if(response.statusCode == 200){
    // print(response.body);
    // final json = jsonDecode(response.body);
    return WeatherInfo.fromJson(jsonDecode(response.body));
      
    }else{
      throw Exception('failed to load data');
    

    }

    } catch (e) {
      rethrow;
    }

  }
}