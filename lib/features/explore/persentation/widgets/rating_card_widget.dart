import 'package:booking_app/core/utils/app_colors.dart';
import 'package:booking_app/features/explore/persentation/widgets/rating_bar.dart';
import 'package:flutter/cupertino.dart';


class RatingCardWidget extends StatelessWidget {
  final double roomRating;
  final double servicsRating;
  final double locationRating;
  final double priceRating;
  const RatingCardWidget(
      {super.key,
        required this.roomRating,
        required this.servicsRating,
        required this.locationRating,
        required this.priceRating});

  @override
  Widget build(BuildContext context) {
    double overallRating =
        (roomRating + servicsRating + locationRating + priceRating) / 4;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overallRating.toStringAsFixed(1),
                    style: TextStyle(
                      color: AppColors.myGreen,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "room",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "services",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "location",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "price",
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.9),
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    'Overall rating',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.9),
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(
                    height: 7,
                  ),
                  RatingBar(rate: roomRating),
                  const SizedBox(
                    height: 7,
                  ),
                  RatingBar(rate: servicsRating),
                  const SizedBox(
                    height: 7,
                  ),
                  RatingBar(rate: locationRating),
                  const SizedBox(
                    height: 7,
                  ),
                  RatingBar(rate: priceRating),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
