import 'package:doctor_appointment/core/routing/routes.dart';
import 'package:doctor_appointment/features/login/presentation/screens/login_screen.dart';
import 'package:doctor_appointment/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like ( arguments as classname )
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No Route Found for this path ${settings.name} , please check the route name',
              ),
            ),
          ),
        );
    }
  }
}
