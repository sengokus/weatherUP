import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
          totalPage: 3,
          headerBackgroundColor: Colors.white,
          speed: 1.8,
          background: [
            Image.asset('lib/assets/image1.jpg'),
            Image.asset('lib/assets/image2.jpg'),
            Image.asset('lib/assets/image3.jpg'),
          ],
          pageBodies: [
            Container(
              child: Center(
                child: Text('Page 1'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Page 2'),
              ),
            ),
            Container(
              child: Center(
                child: Text('Page 3'),
              ),
            ),
          ]),
    );
  }
}
