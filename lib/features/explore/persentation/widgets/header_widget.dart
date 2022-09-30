import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class HeaderWidget extends StatelessWidget {
  final String title;
  const HeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          Row(
            children: [
              Text(
                'View All',
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
      ),
    );
  }
}
