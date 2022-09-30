import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/functions.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../splash/presentaion/components/default_item.dart';
import '../components/default_text_form_field.dart';
import 'package:booking_app/dependency_container.dart' as di;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => di.sl(),
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    var cubit = AuthCubit.get(context);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
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
                          controller: cubit.emailController,
                          validator: (value) {
                            return emailValidator(value);
                          },
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
                          controller: cubit.passwordController,
                          validator: (value) {
                            return passwordValidator(value);
                          },
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, AppRoutingNames.forgetPass);
                              },
                              child: Text('Forgot your password?'),
                            ),
                          ],
                        ),
                        (state is AuthSignInLoading)
                            ? const Center(child: CircularProgressIndicator())
                            : DefaultElevatedButton(
                                height: 45.h,
                                backgroundColor: Colors.blue,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.login(context);
                                  }
                                },
                                title: 'Login',
                              )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
