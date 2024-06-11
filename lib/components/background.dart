import 'package:flutter/material.dart';

class BuildBackground extends StatelessWidget {
  final List<Widget> children;
  final PreferredSizeWidget? appBar;

  const BuildBackground({required this.children, this.appBar, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
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
