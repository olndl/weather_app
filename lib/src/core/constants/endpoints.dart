import 'package:weather_app/src/app/app_secrets.dart';

class Endpoints {
  Endpoints._();
  static const String contentType = 'application/json';
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=Moscow&lang=ru&units=metric&appid=30e5e743e39fe72bad4bd30151d2b56b';
  static const String weather = 'weather';
  static const String forecast = 'forecast';
  static const Map<String, Object> headers = {'appid': AppSecrets.apiKey};
  static final Map<String, Object> params = {
    'q': 'Moscow',
    'lang': 'ru',
    'units': 'metric',
  };
}
//Platform.localeName.toString()
