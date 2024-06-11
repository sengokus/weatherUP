import 'package:flutter/material.dart';

import 'package:weatherup/utils/weather.dart';
import 'package:weatherup/components/background.dart';
import 'package:weatherup/components/temperature.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherService? weatherService;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    weatherService = WeatherService(); // Initialize the WeatherService
    initWeather();
  }

  // Initialize the weather data
  Future<void> initWeather() async {
    await weatherService?.initWeather();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(
          weatherService?.weather?.areaName ?? '',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      children: <Widget>[
        Center(
          child: weatherService?.currentPosition != null &&
                  weatherService?.weather != null
              ? Column(
                  children: [
                    const SizedBox(height: 50),
                    TemperatureIndicator(
                      temp:
                          "${weatherService?.weather!.temperature!.celsius!.toStringAsFixed(1)}\u00B0",
                    ),
                    const SizedBox(height: 50),
                    Text(
                      weatherService?.forecast[0]?.temperature!.celsius
                              ?.toStringAsFixed(1) ??
                          '',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      weatherService?.forecast[1]?.temperature!.celsius
                              ?.toStringAsFixed(1) ??
                          '',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                )
              : weatherService?.locationError != null
                  ? Text(
                      "Error: ${weatherService?.locationError}",
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  : const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
