import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/const_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:booking_app/dependency_container.dart' as di;
import '../../../splash/presentaion/components/default_item.dart';
import '../components/default_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => di.sl(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  var cubit = AuthCubit.get(context);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text('Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25.sp)),
                      SizedBox(
                        height: 8.h,
                      ),
                      ProfileImage(
                        cubit: cubit,
                        onPressed: () async {
                          cubit.getProfileImage(context);
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      DefaultTextFormField(
                        hintText: 'enter your username',
                        lable: 'Your username',
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
                              showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                        height: 24.h,
                      ),
                      DefaultTextFormField(
                        hintText: 'confirm your password',
                        lable: 'Your password',
                        keyboardType: TextInputType.visiblePassword,
                        keyboardAction: TextInputAction.next,
                        height: 50.h,
                        isPassword: !showPassword,
                        controller: TextEditingController(),
                        validator: (value) {},
                        suffix: IconButton(
                          icon: Icon(
                              showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                        height: 50.h,
                        backgroundColor: Colors.blue,
                        onPressed: () {},
                        title: 'Sign Up',
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(termsAgreed,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.caption!.copyWith()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(alreadyHasAccount,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith()),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.centerLeft,
                            ),
                            child: Text('Login'),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.onPressed,
    required this.cubit,
  }) : super(key: key);

  final VoidCallback onPressed;
  final AuthCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          ClipOval(
            child: cubit.profileImage == null
                ? Image.asset('assets/images/background.jpg',
                    height: 130.h, width: 130.h, fit: BoxFit.fill)
                : Image.file(cubit.profileImage!,
                    height: 130.h, width: 130.h, fit: BoxFit.fill),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 45.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3.w)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.upload,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
