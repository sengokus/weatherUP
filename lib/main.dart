import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'onboarding.dart';

void main() {
  runApp(const MainApp());
}

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingPage(),
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
          primaryColor: const Color.fromARGB(255, 8, 14, 41),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 233, 234, 235),
            ),
            displayMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
                primary: Color.fromARGB(255, 40, 64, 170),
                onPrimary: Color.fromARGB(255, 40, 64, 170),
                secondary: Color.fromARGB(255, 233, 234, 235),
                onSecondary: Color.fromARGB(255, 233, 234, 235),
                error: Color.fromARGB(255, 230, 30, 30),
                onError: Color.fromARGB(255, 230, 30, 30),
                surface: Color.fromARGB(255, 233, 234, 235),
                onSurface: Color.fromARGB(255, 233, 234, 235)),
            textTheme: ButtonTextTheme.primary,
          )),
    );
  }
}
