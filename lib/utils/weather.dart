import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'geolocator.dart';
import 'const.dart';

class WeatherService {
  final WeatherFactory _wf = WeatherFactory(openWeatherAPIkey);

  Position? currentPosition;
  String? locationError;
  Weather? weather;
  List<Weather> forecast = [];
  late List<Weather?> forecastList;

  Future<void> initWeather() async {
    await fetchCurrentPosition();
    if (currentPosition != null) {
      await fetchWeather();
      await fetchForecast();
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
      weather = w;
    } catch (e) {
      locationError = "Failed to fetch weather data: $e";
    }
  }

  // Fetch the forecast data based on the current position
  Future<void> fetchForecast() async {
    if (currentPosition == null) {
      locationError = "Current position is not available";
      return;
    }
    try {
      List<Weather> f = await _wf.fiveDayForecastByLocation(
          currentPosition!.latitude, currentPosition!.longitude);
      forecast = _filterForecastList(f);
    } catch (e) {
      locationError = "Failed to fetch forecast data: $e";
    }
  }

  // Filter the forecast to get one forecast per day
  List<Weather> _filterForecastList(List<Weather> forecastList) {
    Map<String, Weather> dailyForecast = {};
    for (var f in forecastList) {
      String date = f.date!.toIso8601String().split('T')[0];
      if (!dailyForecast.containsKey(date)) {
        dailyForecast[date] = f;
      }
    }
    return dailyForecast.values.toList();
  }
}
