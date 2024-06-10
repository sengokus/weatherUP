import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  final List<Widget> children;

  const BuildBackground({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              )),
          ...children,
        ],
      ),
    );
  }
}
