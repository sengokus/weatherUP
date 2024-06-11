import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'geolocator.dart';
import 'const.dart';

class WeatherService {
  final WeatherFactory _wf = WeatherFactory(openWeatherAPIkey);

  Position? currentPosition;
  String? locationError;
  Weather? weather;
  late List<Weather?> forecast;

  Future<void> initWeather() async {
    await fetchCurrentPosition();
    if (currentPosition != null) {
      await fetchWeather();
    }
  }

  // Fetch the current position of the device
  Future<void> fetchCurrentPosition() async {
    try {
      Position position = await determinePosition();
      currentPosition = position;
      locationError = null;
    } catch (e) {
      locationError = "Failed to fetch location data: $e";
    }
  }

  // Fetch the weather data based on the current position
  Future<void> fetchWeather() async {
    if (currentPosition == null) {
      locationError = "Current position is not available";
      return;
    }
    try {
      Weather w = await _wf.currentWeatherByLocation(
          currentPosition!.latitude, currentPosition!.longitude);
      List<Weather> f = await _wf.fiveDayForecastByLocation(
          currentPosition!.latitude, currentPosition!.longitude);
      forecast = f;
      weather = w;
    } catch (e) {
      locationError = "Failed to fetch weather data: $e";
    }
  }
}
