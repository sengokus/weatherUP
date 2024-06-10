import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weatherup/components/background.dart';
import 'package:weatherup/utils/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  String? _locationError;

  @override
  void initState() {
    super.initState();
    _fetchCurrentPosition();
  }

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

  @override
  Widget build(BuildContext context) {
    return BuildBackground(
      children: <Widget>[
        Center(
          child: _currentPosition != null
              ? Text(
                  "Latitude: ${_currentPosition!.latitude}\nLongitude: ${_currentPosition!.longitude}",
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
