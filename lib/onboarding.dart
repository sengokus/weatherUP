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
          Image.asset('lib/assets/image3.jpg'),
          Image.asset('lib/assets/image3.jpg'),
          Image.asset('lib/assets/image3.jpg'),
        ],
        centerBackground: true,
        trailing: const Text('Hi!'), // Remove
        pageBodies: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
                child: Text('Hi!',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.displayMedium?.fontSize,
                        color:
                            Theme.of(context).textTheme.displayMedium?.color))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
                child: Text('Hi!',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.displayMedium?.fontSize,
                        color:
                            Theme.of(context).textTheme.displayMedium?.color))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Center(
                child: Text('Hi!',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.displayMedium?.fontSize,
                        color:
                            Theme.of(context).textTheme.displayMedium?.color))),
          ),
        ]);
  }
}
