import 'package:booking_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MySpacer extends StatelessWidget {
  const MySpacer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.darkGrey,
    );
  }
}