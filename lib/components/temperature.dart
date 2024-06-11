import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildTemperatureIndicator(String temp, Text time, BuildContext context) {
  DateTime time = DateTime.now();
  String formattedTime = DateFormat('h:mm a').format(time);

  return Column(
    children: [
      Text("Feels like", style: Theme.of(context).textTheme.bodyLarge),
      Text(temp,
          style: TextStyle(
              fontSize: 48,
              fontWeight: Theme.of(context).textTheme.displayLarge!.fontWeight,
              color: Theme.of(context).textTheme.displayLarge!.color)),
      Text(formattedTime, style: Theme.of(context).textTheme.bodyLarge),
    ],
  );
}
