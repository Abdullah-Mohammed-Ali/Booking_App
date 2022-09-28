import 'package:booking_app/features/explore/presentation/screens/explore_screen.dart';
import 'package:booking_app/features/splash/presentaion/splash_screen.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingNames.splash:
        return _fadeInRoute(page: ExploreScreen());
    }
  }

  static PageRouteBuilder _fadeInRoute({page, durationInMillisec = 750}) {
    return PageRouteBuilder(
        pageBuilder: (_, a1, a2) => page,
        transitionsBuilder: (_, a1, a2, child) => FadeTransition(
              opacity: a1,
              child: child,
            ),
        transitionDuration: Duration(milliseconds: durationInMillisec));
  }
}
