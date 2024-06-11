import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'onboarding.dart';
import 'homepage.dart';

void main() {
  runApp(const MainApp());
}

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomePage(),
  )
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: const Color.fromARGB(255, 4, 8, 26),
          primaryColorLight: const Color.fromARGB(255, 45, 129, 207),
          splashColor: const Color.fromARGB(255, 16, 27, 75),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 233, 234, 235),
            ),
            displayMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 233, 234, 235),
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 233, 234, 235),
            ),
          ),
          buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme(
                brightness: Brightness.dark,
                primary: Color.fromARGB(255, 45, 129, 207),
                onPrimary: Color.fromARGB(255, 45, 129, 207),
                secondary: Color.fromARGB(145, 45, 129, 207),
                onSecondary: Color.fromARGB(145, 45, 129, 207),
                error: Color.fromARGB(255, 230, 30, 30),
                onError: Color.fromARGB(255, 230, 30, 30),
                surface: Color.fromARGB(255, 233, 234, 235),
                onSurface: Color.fromARGB(255, 233, 234, 235)),
            textTheme: ButtonTextTheme.primary,
          )),
    );
  }
}
