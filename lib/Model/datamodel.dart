class WeatherInfo {
  final String name;
  final String description;
  final String icon;
  final double temp; 

  WeatherInfo({this.name = '', this.description= '' , this.icon= '', this.temp=0});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
    name: json['name']?? '',
    description: json['weather'][0]['description'] ?? '',
    icon: json['weather'][0]['icon'] ?? '',
    temp: json['main']['temp']??0
    // return WeatherInfo(description: description, icon: icon);
    );
    }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  // final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({required this.cityName, required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    // final tempInfoJson = json['main'];
    // final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName, weatherInfo: weatherInfo);
  }
}