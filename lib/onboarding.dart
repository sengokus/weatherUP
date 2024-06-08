import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: Theme.of(context).primaryColor,
        pageBackgroundColor: Theme.of(context).primaryColor,
        skipIcon: Icon(Icons.keyboard_arrow_right,
            color: Theme.of(context).buttonTheme.colorScheme?.secondary),
        finishButtonText: 'Get Started',
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
            splashColor: Theme.of(context).splashColor),
        controllerColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
        speed: 1.8,
        background: [
          Image.asset('lib/assets/image3.jpg', height: 400),
          Image.asset('lib/assets/image3.jpg', height: 400),
          Image.asset('lib/assets/image3.jpg', height: 400),
        ],
        centerBackground: true,
        pageBodies: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'On your way...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'to find the perfect looking Onboarding for your app?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'On your way...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'to find the perfect looking Onboarding for your app?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 480,
                ),
                Text(
                  'On your way...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'to find the perfect looking Onboarding for your app?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ]);
  }
}
