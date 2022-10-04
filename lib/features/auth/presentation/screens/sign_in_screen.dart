import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:booking_app/features/auth/presentation/functions.dart';
import 'package:booking_app/features/auth/presentation/screens/signin2.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicons/unicons.dart';
import '../../../explore/persentation/widgets/loading.dart';
import '../../../splash/presentaion/components/default_item.dart';
import '../components/default_text_form_field.dart';
import 'package:booking_app/dependency_container.dart' as di;

import '../components/defauiltelavtedbuttonw.dart';

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
    Size size = MediaQuery.of(context).size;


    return BlocProvider<AuthCubit>(
      create: (context) => di.sl(),
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.1),
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){

                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.pop(context);
              },


            ),

            title:             Text('Login',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(

    child: SizedBox(

    //height: size.height,

                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        var cubit = AuthCubit.get(context);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [



                                  SizedBox(
                                    height: 20.h,
                                  ),



                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 44,
                                        width: 150,
                                        child: DefaultElevatedButton2(title: 'FaceBook', onPressed: () {  },

                                          icon: UniconsLine.facebook_f,
                                          backgroundColor: Colors.blue[800]!,




                                        ),
                                      ),

                                     // SizedBox(width: 30,),
                                      Container(
                                        height: 44,
                                        width: 150,
                                        child: DefaultElevatedButton2(
                                          icon: UniconsLine.twitter,


                                          title: 'Twitter', onPressed: () {  },

                                          backgroundColor: Colors.lightBlueAccent,




                                        ),
                                      ),

                                    ],
                                  ),





                                  SizedBox(
                                    height: 30.h,
                                  ),



                                  DefaultTextFormField(
                                    icon: UniconsLine.enter,
                                    hintText: 'enter your email',
                                    //lable: 'Your email',
                                    height: 50.h,

                                    keyboardAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    controller: cubit.emailController,
                                    validator: (value) {
                                      return emailValidator(value);
                                    },
                                  ),




                                  SizedBox(
                                    height: 10.h,
                                  ),


                                  DefaultTextFormField(
                                    icon: UniconsLine.enter,
                                    hintText: 'enter your password',
                                   // lable: 'Your password',
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
                                        child:

                                        Text('Forgot your password?',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                              color: Colors.grey,
                                                //fontWeight: FontWeight.w600,
                                                fontSize: 9.sp)),

                                      ),
                                    ],
                                  ),
                                  (state is AuthSignInLoading)
                                      ?   SizedBox(
                                      width: 400.0,
                                      height: 100.0,

                                      child: Loading())
                                      : DefaultElevatedButton(
                                          height: 40.h,
                                          backgroundColor: Colors.teal,
                                          onPressed: () {
                                            if (formKey.currentState!.validate()) {
                                              cubit.login(context);
                                            }
                                          },
                                          title: 'Login',
                                        )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
