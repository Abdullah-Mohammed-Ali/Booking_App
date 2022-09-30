<<<<<<< HEAD
import 'package:booking_app/features/booking/presentation/screens/hotels_maps_screen.dart';
import 'package:booking_app/features/home_nav/presentation/screens/filter_screen.dart';
=======
import 'package:booking_app/features/home_nav/presentation/screens/explore_screen.dart';
>>>>>>> main

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
        return _fadeInRoute(page: const ExploreScreen());
      case AppRoutingNames.homeNavScreen:
        return _fadeInRoute(page: const HomeView());
      case AppRoutingNames.mapsScreen:
        return _fadeInRoute(page: const HotelsMapScreen());
      case AppRoutingNames.filterScreen:
        return _fadeInRoute(page: const FilterScreen());
      case AppRoutingNames.searchScreen:
        return _fadeInRoute(page: const SearchScreen());
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