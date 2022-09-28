import 'package:booking_app/features/splash/presentaion/splash_screen.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';

import '../features/home_nav/presentation/screens/explore_screen.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingNames.splash:
<<<<<<< HEAD
        return _fadeInRoute(page: ExploreScreen());
=======
        return _fadeInRoute(page: const SplashScreen());
      case AppRoutingNames.onBoarding:
        return _fadeInRoute(page: const OnBoardingScreen());
      case AppRoutingNames.signIn:
        return _fadeInRoute(page: const SignInScreen());
      case AppRoutingNames.signUp:
        return _fadeInRoute(page: const SignUpScreen());
      case AppRoutingNames.forgetPass:
        return _fadeInRoute(page: const ForgetPassScreen());
      case AppRoutingNames.homeScreen:
        return _fadeInRoute(page: const ExploreScreen());
>>>>>>> main
    }
  }

  static PageRouteBuilder _fadeInRoute({page, durationInMillisec = 1000}) {
    return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => page,
        transitionsBuilder: (_, a1, a2, child) => FadeTransition(
              opacity: a1,
              child: child,
            ),
        transitionDuration: Duration(milliseconds: durationInMillisec));
  }
}
