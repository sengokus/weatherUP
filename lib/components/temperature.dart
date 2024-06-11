import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TemperatureIndicator extends StatefulWidget {
  final String temp;

  const TemperatureIndicator({required this.temp, super.key});

  @override
  State<TemperatureIndicator> createState() => _TemperatureIndicatorState();
}

class _TemperatureIndicatorState extends State<TemperatureIndicator> {
  late String formattedTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    formattedTime = DateFormat('h:mm a').format(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        formattedTime = DateFormat('h:mm a').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Feels like", style: Theme.of(context).textTheme.bodyLarge),
        Text(widget.temp,
            style: TextStyle(
                fontSize: 64,
                fontWeight:
                    Theme.of(context).textTheme.displayLarge!.fontWeight,
                color: Theme.of(context).textTheme.displayLarge!.color)),
        Text(formattedTime, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
