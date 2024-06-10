import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:weatherup/components/sliderpage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  late final PageController _controller = PageController();

  final List<Widget> _pages = [
    const SliderPage(
        title: "Meow", description: "Meowwww", image: "lib/assets/image1.jpg"),
    const SliderPage(
        title: "Meow",
        description: "Meowwwwwwww",
        image: "lib/assets/image2.jpg"),
    const SliderPage(
        title: "Meow",
        description: "Meowwwwwwwwwwwwww",
        image: "lib/assets/image3.jpg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

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
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // Generate the page indicator
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.primary
                                : Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.secondary));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: const Duration(milliseconds: 300),
                  height: 50,
                  width: (_currentPage == (_pages.length - 1)) ? 180 : 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(35)),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: (_currentPage == (_pages.length - 1))
                        ? InkWell(
                            onTap: () {
                              // Navigate to the HomePage
                              context.go('/home');
                            },
                            child: Text(
                              "Get Started",
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          )
                        : const Icon(
                            Icons.navigate_next,
                            size: 50,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}
