import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/forget_pass_screen.dart';
import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/explore/presentation/screens/explore_screen.dart';
import '../features/splash/presentaion/screens/onboarding_screen.dart';
import '../features/splash/presentaion/screens/splash_screen.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingNames.splash:
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
        return _fadeInRoute(page: ExploreScreen());
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
