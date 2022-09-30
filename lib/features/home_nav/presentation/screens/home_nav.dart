

import 'package:booking_app/features/booking/persentation/pages/bookingpage.dart';
import 'package:booking_app/features/explore/persentation/pages/hotelspage.dart';
import 'package:booking_app/features/profile/persentation/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentIndex = 0;
  final List<Widget> _views = [
    HotelsPage(),
    BookingPage(),
    ProfilePage(),
  ];

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return

      Scaffold(
        body: IndexedStack(
          children: _views,
          index: _currentIndex,
        ),




        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).iconTheme.color,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          enableFeedback: false,
          showUnselectedLabels: false,

          items: const [
            BottomNavigationBarItem(

              icon: Icon(UniconsLine.home_alt ,size: 30), label: 'Timeline' ,),
            BottomNavigationBarItem(
                icon: Icon(UniconsLine.search, size: 30), label: 'Chat'),

            BottomNavigationBarItem(//comment_dots
                icon: Icon(UniconsLine.user ,size: 30 ), label: 'Favourite'),

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
