import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    Key? key,
    required this.lottiePath,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String lottiePath;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        children: [
          SizedBox(
              height: 250.h,
              width: double.maxFinite,
              child: Lottie.asset(
                lottiePath,
              )),
          SizedBox(
            height: 50.h,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 25.sp)),
          SizedBox(
            height: 30.h,
          ),
          Text(subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption)
        ],
      ),
    );
  }
}
