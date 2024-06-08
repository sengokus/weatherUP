import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: Colors.transparent,
        skipIcon: Icon(Icons.keyboard_arrow_right,
            color: Theme.of(context).buttonTheme.colorScheme?.secondary),
        finishButtonText: "Get Started",
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
        ),
        speed: 1.8,
        background: [
          Image.asset('lib/assets/image1.jpg'),
          Image.asset('lib/assets/image2.jpg'),
          Image.asset('lib/assets/image3.jpg'),
        ],
        centerBackground: true,
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 1'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 2'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              children: <Widget>[
                SizedBox(
                  height: 480,
                ),
                Text('Description Text 3'),
              ],
            ),
          ),
        ]);
  }
}
