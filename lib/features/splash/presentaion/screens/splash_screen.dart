import 'package:booking_app/routing/app_routing_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/default_item.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logoWidth = 250.w;
    var logoHeight = 350.h;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black12.withOpacity(0.4),
            BlendMode.srcOver,
          ),
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 15.h,
          right: (MediaQuery.of(context).size.width) / 2 - logoWidth / 2,
          width: logoWidth,
          height: logoHeight,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        Positioned(
          bottom: 50.h,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DefaultElevatedButton(
                  title: 'Start',
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, AppRoutingNames.onBoarding);
                  },
                ),
              ),
              SizedBox(
                height: 0.h,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('Already have account? Log in',
                      style: TextStyle(color: Colors.white)))
            ],
          ),
        ),
      ],
    ));
  }
}
