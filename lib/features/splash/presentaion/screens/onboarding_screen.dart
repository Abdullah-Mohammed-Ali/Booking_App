import 'package:booking_app/features/splash/presentaion/components/on_boarding_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/default_item.dart';
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
        body: Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: CarouselSlider(
              items: onBoardingItems
                  .map(
                    (e) => OnBoardingItem(
                        lottiePath: e.lottiePath,
                        title: e.title,
                        subTitle: e.subtitle),
                  )
                  .toList(),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                disableCenter: true,
                height: 480.h,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                viewportFraction: 1,
              )),
        ),
        AnimatedSmoothIndicator(
            effect: WormEffect(
                radius: 8.h,
                dotHeight: 8.h,
                dotColor: Colors.grey.shade300,
                dotWidth: 8.w),
            activeIndex: pageIndex,
            count: onBoardingItems.length),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.h),
          child: DefaultElevatedButton(
              height: 42.h,
              elevation: 0,
              title: 'Login',
              onPressed: () {},
              backgroundColor: Colors.blue),
        ),
        SizedBox(
          height: 18.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.h),
          child: DefaultElevatedButton(
              height: 42.h,
              elevation: 1,
              title: 'Create account',
              onPressed: () {},
              textColor: Colors.black,
              backgroundColor: Colors.white),
        ),
      ],
    ));
  }
}
