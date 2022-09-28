import 'package:booking_app/features/explore/presentation/screens/explore_screen.dart';
import 'package:booking_app/features/home_nav/presentation/screens/favourites_scrren.dart';
import 'package:booking_app/features/home_nav/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int currentIndex = 0;
  var pageController = PageController();

  List<Widget> pages = [
    const ExploreScreen(),
    const FavouritesScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.magnifyingGlass), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart), label: 'trips'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.person), label: 'Profile'),
          ],
          currentIndex: currentIndex,
          onTap: (index) {
            print(index);
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(currentIndex);
            });
          },
        ),
        body: PageView.builder(
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
