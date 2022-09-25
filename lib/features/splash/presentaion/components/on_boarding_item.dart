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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Lottie.asset(lottiePath),
          SizedBox(
            height: 50.h,
          ),
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 25.sp)),
          SizedBox(
            height: 16.h,
          ),
          Text(subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption)
        ],
      ),
    );
  }
}
