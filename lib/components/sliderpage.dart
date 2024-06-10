import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SliderPage(
      {required this.title,
      required this.description,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          width: width * 0.6,
        ),
        const SizedBox(
          height: 60,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Text(
            description,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
