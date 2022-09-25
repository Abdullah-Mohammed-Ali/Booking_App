import 'package:booking_app/features/splash/presentaion/components/on_boarding_item.dart';
import 'package:booking_app/features/splash/presentaion/screens/splash_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../const/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              CarouselSlider(
                  items: onBoardingItems
                      .map((e) => OnBoardingItem(
                          lottiePath: e.lottiePath,
                          title: e.title,
                          subTitle: e.subtitle))
                      .toList(),
                  options: CarouselOptions(
                    height: 480.h,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    viewportFraction: 1,
                  )),
              AnimatedSmoothIndicator(
                  effect:
                      WormEffect(radius: 8.h, dotHeight: 10.h, dotWidth: 10.w),
                  activeIndex: pageIndex,
                  count: onBoardingItems.length),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: DefaultElevatedButton(
                    title: 'Sign in',
                    onPressed: () {},
                    backgroundColor: Colors.blue),
              ),
              DefaultElevatedButton(
                  height: 60.h,
                  title: 'Sign in',
                  onPressed: () {},
                  backgroundColor: Colors.white),
            ],
          ),
        ));
  }
}
