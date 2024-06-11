import 'dart:developer';

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
    log("Weather area name: ${weatherService?.weather?.areaName}");
    log("Forecast length: ${weatherService?.forecast.length}");
    log("Example forecast: ${weatherService?.forecast[0]}");
    log("Location error: ${weatherService?.locationError}");
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
                  weatherService?.weather != null &&
                  weatherService?.forecast != null
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            "https://openweathermap.org/img/wn/${weatherService!.weather?.weatherIcon}@4x.png"),
                      )),
                    ),
                    // Text("${weatherService?.weather?.weatherDescription}"),
                    TemperatureIndicator(
                      temp:
                          "${weatherService?.weather!.temperature!.celsius!.toStringAsFixed(1)}\u00B0",
                    ),
                    const SizedBox(height: 50),
                    if (weatherService!.forecast.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: weatherService!.forecast.length - 1,
                          itemBuilder: (context, index) {
                            final forecast =
                                weatherService?.forecast[index + 1];
                            return ListTile(
                              contentPadding: const EdgeInsets.all(2.0),
                              leading: Image.network(
                                "https://openweathermap.org/img/wn/${forecast?.weatherIcon}.png",
                              ),
                              title: Text(forecast?.weatherDescription ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              subtitle: Text(
                                "${forecast?.temperature?.celsius?.toStringAsFixed(1)}\u00B0",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            );
                          },
                        ),
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
