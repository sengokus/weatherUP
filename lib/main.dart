import 'package:flutter/cupertino.dart';
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
    return CupertinoApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
