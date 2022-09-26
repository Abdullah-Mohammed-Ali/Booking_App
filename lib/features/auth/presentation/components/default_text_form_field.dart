import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField(
      {Key? key,
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

  final FormFieldValidator validator;
  final TextEditingController controller;
  TextInputType? keyboardType;
  TextInputAction? keyboardAction;
  bool? isPassword;
  Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(lable ?? '',
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 12.sp)),
        ),
        SizedBox(
          height: 4.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.h),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 10.h,
                    offset: Offset(1.w, 3.h),
                    spreadRadius: 0)
              ]),
          child: TextFormField(
              validator: validator,
              textInputAction: keyboardAction,
              keyboardType: keyboardType,
              obscureText: isPassword ?? false,
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: suffix,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hintText ?? '',
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.h),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.h),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.h),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.h),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.h),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}
