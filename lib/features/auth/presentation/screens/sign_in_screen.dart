import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../splash/presentaion/components/default_item.dart';
import '../components/default_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 25.sp)),
                SizedBox(
                  height: 60.h,
                ),
                DefaultTextFormField(
                  hintText: 'enter your email',
                  lable: 'Your email',
                  height: 50.h,
                  keyboardAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                  validator: (value) {},
                ),
                SizedBox(
                  height: 24.h,
                ),
                DefaultTextFormField(
                  hintText: 'enter your password',
                  lable: 'Your password',
                  keyboardType: TextInputType.visiblePassword,
                  keyboardAction: TextInputAction.next,
                  height: 50.h,
                  isPassword: !showPassword,
                  controller: TextEditingController(),
                  validator: (value) {},
                  suffix: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    splashColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                DefaultElevatedButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {},
                  title: 'Login',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
