import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final String reviewerName;
  final String imageUrl;
  final double rate;
  final String review;
  const ReviewWidget(
      {super.key,
        required this.reviewerName,
        required this.imageUrl,
        required this.rate,
        required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                height: 65,
                width: 65,
                fit: BoxFit.cover,
                image: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewerName,
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
                SizedBox(height: 5,),
                Text(
                  'LastUpdated 21 May, 2019',
                  style: TextStyle(color: AppColors.lightGrey, fontSize: 9),
                ),
                SizedBox(height: 5,),

                Text(
                  '($rate)',
                  style: TextStyle(color: AppColors.white, fontSize: 9),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          review,
          style: TextStyle(color: AppColors.lightGrey, fontSize: 9),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Reply',
              style: TextStyle(
                  color: AppColors.myGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 9),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColors.myGreen,
              size: 11,
            )
          ],
        ),
      ],
    );
  }
}
