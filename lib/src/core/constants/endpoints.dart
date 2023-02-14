class Endpoints {
  Endpoints._();
  static const String contentType = 'application/json';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String weather = '$baseUrl/weather';
  static const String forecast = '$baseUrl/forecast';
  static const String aqi = '$baseUrl/air_pollution';
}
