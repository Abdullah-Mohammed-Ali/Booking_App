import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rate;
  const RatingBar({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const  EdgeInsets.only(bottom: 8),
      width: (MediaQuery.of(context).size.width * rate) / 17,
      height: 6,
      decoration: BoxDecoration(
          color: AppColors.myGreen, borderRadius: BorderRadius.circular(10)),
    );
  }
}
