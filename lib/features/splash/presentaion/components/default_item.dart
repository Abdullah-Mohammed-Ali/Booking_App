import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultElevatedButton extends StatelessWidget {
  DefaultElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    this.height,
    this.elevation,
    this.textColor = Colors.white,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  Color textColor;
  final Color backgroundColor;
  double? height;
  double? elevation;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(elevation ?? 3),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        onPressed: onPressed,
        child: Text(title,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w300)),
      ),
    );
  }
}
