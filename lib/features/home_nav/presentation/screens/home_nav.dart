

import 'package:booking_app/features/booking/persentation/pages/bookingpage.dart';
import 'package:booking_app/features/explore/persentation/pages/hotelspage.dart';
import 'package:booking_app/features/home_nav/presentation/components/animatedIndexStack.dart';
import 'package:booking_app/features/profile/persentation/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:animations/animations.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentIndex = 0;
  late PageController _pageController;


  final List<Widget> _views = [
    Stack(
      children: [
        HotelsPage(),
      ],
    ),
    Stack(
      children: [
        BookingPage(),
      ],
    ),
    Stack(
      children: [
        ProfilePage(),
      ],
    ),
  ];

  @override
  void initState() {
    _pageController = PageController();


    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
       // extendBody: true,
        body:



        // AnimatedIndexedStack(
        //   index: _currentIndex,
        //   children: _views,
        // ),




        IndexedStack(
          index: _currentIndex,
          children: _views,
        ),







        bottomNavigationBar:










        BottomNavigationBar(


          backgroundColor: Colors.black.withOpacity(0.5),


          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize:30,


          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.white,


          showSelectedLabels: false,
          enableFeedback: false,
          showUnselectedLabels: false,
        //  selectedLabelStyle: TextStyle(color: Colors.teal),



          items: const [
            BottomNavigationBarItem(


              icon: Icon(UniconsLine.home_alt ,), label: 'Timeline' ,),
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.atom, ), label: 'Chat'),

            BottomNavigationBarItem(//comment_dots
                icon: Icon(UniconsLine.user , ), label: 'Favourite'),

          ],
        ),

        // last bottom navigatipn bar


/*
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () { },
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 2.0,
          backgroundColor: Colors.blueAccent,
        ),

      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
      color:Colors.black,
      shape: CircularNotchedRectangle(), //shape of notch
      notchMargin: 5, //notche margin between floating button and bottom appbar
      child: Row( //children inside bottom appbar
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      IconButton(icon: Icon(UniconsLine.home_alt, color: Colors.white, size: 30,), onPressed: () {},),
      IconButton(icon: Icon(UniconsLine.search, color: Colors.white , size: 30,), onPressed: () {},),
    IconButton(icon: Icon(UniconsLine.heart, color: Colors.white, size: 30), onPressed: () {},),
    IconButton(icon: Icon(UniconsLine.user, color: Colors.white, size: 30), onPressed: () {},),
    ],
    ),

      )

 */




      );
  }
}
