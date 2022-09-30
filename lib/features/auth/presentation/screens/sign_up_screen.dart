import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/const_strings.dart';
import 'package:booking_app/features/auth/presentation/functions.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:booking_app/dependency_container.dart' as di;
import '../../../splash/presentaion/components/default_item.dart';
import '../components/default_text_form_field.dart';
import '../components/profile_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  double spacing = 16;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => di.sl(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0x302F30),
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                key: UniqueKey(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Form(
                    key: formKey,
                    child: Column(
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
                          height: spacing.h,
                        ),
                        DefaultTextFormField(
                          hintText: 'enter your username',
                          lable: 'Your username',
                          height: 50.h,
                          keyboardAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: cubit.usernameController,
                          validator: (value) {
                            return usernameValidation(value);
                          },
                        ),
                        SizedBox(
                          height: spacing.h,
                        ),
                        DefaultTextFormField(
                          hintText: 'enter your email',
                          lable: 'Your email',
                          height: 50.h,
                          keyboardAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          controller: cubit.emailController,
                          validator: (value) {
                            return emailValidator(value);
                          },
                        ),
                        SizedBox(
                          height: spacing.h,
                        ),
                        DefaultTextFormField(
                          key: UniqueKey(),
                          hintText: 'enter your password',
                          lable: 'Your password',
                          keyboardType: TextInputType.visiblePassword,
                          keyboardAction: TextInputAction.next,
                          height: 50.h,
                          isPassword: !cubit.isPasswordNotObscure,
                          controller: cubit.passwordController,
                          validator: (value) {
                            return passwordValidator(value);
                          },
                          suffix: IconButton(
                            icon: Icon(
                                cubit.isPasswordNotObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                cubit.isPasswordNotObscure = cubit
                                    .showPassword(cubit.isPasswordNotObscure);
                              });
                            },
                            splashColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          height: spacing.h,
                        ),
                        DefaultTextFormField(
                          hintText: 'confirm your password',
                          lable: 'Your password',
                          keyboardType: TextInputType.visiblePassword,
                          keyboardAction: TextInputAction.next,
                          height: 50.h,
                          isPassword: !cubit.isPasswordConfirmationNotObscure,
                          controller: cubit.passwordConfirmationController,
                          validator: (value) {
                            return passwordConfirmationValidator(value,
                                cubit.passwordConfirmationController.text);
                          },
                          suffix: IconButton(
                            icon: Icon(
                                cubit.isPasswordConfirmationNotObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey),
                            onPressed: () {
                              setState(() {
                                cubit.isPasswordConfirmationNotObscure =
                                    cubit.showPassword(
                                        cubit.isPasswordConfirmationNotObscure);
                              });
                            },
                            splashColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        (state is AuthSignupLoading)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : DefaultElevatedButton(
                                height: 50.h,
                                backgroundColor: Colors.blue,
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    if (cubit.profileImage == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                          'you need to upload a profile picture',
                                        ),
                                      ));
                                    }
                                    await cubit.register(context);
                                  }
                                },
                                title: 'Sign Up',
                              ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(termsAgreed,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith()),
                        LoginInstead(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, AppRoutingNames.signIn);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoginInstead extends StatelessWidget {
  const LoginInstead({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(alreadyHasAccount,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith()),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            alignment: Alignment.centerLeft,
          ),
          child: Text('Login'),
        )
      ],
    );
  }
}
