import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField(
      {Key? key,
        required this.icon,
      required this.controller,
      required this.validator,
      this.hintText,
      this.height,
      this.keyboardAction,
      this.keyboardType,
      this.isPassword,
      this.suffix,
      this.lable})
      : super(key: key);
  String? lable;
  String? hintText;
  double? height;
  IconData icon;

  final FormFieldValidator validator;
  final TextEditingController controller;
  TextInputType? keyboardType;
  TextInputAction? keyboardAction;
  bool? isPassword;
  Widget? suffix;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable ?? '',
            style:

            Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 9.sp)),
        SizedBox(
          height: 4.h,
        ),
    Container(
    height: size.width / 6,
    width: size.width / 1.10,
    alignment: Alignment.center,
    //padding: EdgeInsets.only(right: size.width / 30),
    decoration: BoxDecoration(
    color: Colors.black.withOpacity(.1),
    borderRadius: BorderRadius.circular(30)),
          child: TextFormField(

              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(.8),
              ),
              validator: validator,

              textInputAction: keyboardAction,
              keyboardType: keyboardType,
              obscureText: isPassword ?? false,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
    fillColor: Colors.black.withOpacity(0.2),


                prefixIcon: Icon(
                 icon,
                  color: Colors.white.withOpacity(.8),
                ),
                border: InputBorder.none,
                hintMaxLines: 1,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 11,
                  color: Colors.white.withOpacity(.5),
                ),








                suffixIcon: suffix,
                //hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                //hintText: hintText ?? '',
                isDense: true,
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(25.h),
                //   borderSide: const BorderSide(color: Colors.white),
                // ),
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(25.h),
                //   borderSide: const BorderSide(color: Colors.white),
                // ),

                enabledBorder:  OutlineInputBorder(
                  borderSide:  BorderSide( width: 0.0),
                  borderRadius: BorderRadius.circular(12),

                ),

                errorStyle: TextStyle(
                  fontSize: 5.0,
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              )),
        ),
      ],
    );
  }
}
