import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import 'package:weatherup/components/background.dart';
import 'package:weatherup/utils/const.dart';
import 'package:weatherup/utils/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  Position? _currentPosition;
  String? _locationError;
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _initWeather();
  }

  Future<void> _initWeather() async {
    await _fetchCurrentPosition();
    if (_currentPosition != null) {
      await _fetchWeather();
    }
  }

  // Fetch the current position of the device
  Future<void> _fetchCurrentPosition() async {
    try {
      Position position = await determinePosition();
      setState(() {
        _currentPosition = position;
        _locationError = null;
      });
    } catch (e) {
      setState(() {
        _locationError = e.toString();
      });
    }
  }

  // Fetch the weather data based on the current position
  Future<void> _fetchWeather() async {
    try {
      Weather w = await _wf.currentWeatherByLocation(
          _currentPosition!.latitude, _currentPosition!.longitude);
      setState(() {
        _weather = w;
      });
    } catch (e) {
      setState(() {
        _locationError = "Failed to fetch weather data: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      children: <Widget>[
        Center(
          child: _currentPosition != null && _weather != null
              ? Text(
                  "Latitude: ${_currentPosition!.latitude}\nLongitude: ${_currentPosition!.longitude}\nWeather: ${_weather?.areaName ?? ''}",
                  style: Theme.of(context).textTheme.displayMedium,
                )
              : _locationError != null
                  ? Text(
                      "Error: $_locationError",
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  : const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
