import 'package:flutter/material.dart';

import 'package:weatherup/components/background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const BuildBackground(
      children: <Widget>[
        Center(
          child: Text(
            "Home Page",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 233, 234, 235),
            ),
          ),
        ),
      ],
    );
  }
}
