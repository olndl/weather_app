import 'package:weather_app/src/app/app_secrets.dart';

class Endpoints {
  Endpoints._();
  static const String contentType = 'application/json';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String weather = '$baseUrl/weather';
  static const String forecast = '$baseUrl/forecast';
  static final Map<String, Object> paramsRu = {
    'q': 'Moscow',
    'lang': 'en',
    'units': 'metric',
    'appid': AppSecrets.apiKey
  };
}
