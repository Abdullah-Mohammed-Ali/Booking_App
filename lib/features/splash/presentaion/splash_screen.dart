import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            Colors.black26,
            BlendMode.srcOver,
          ),
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.fill,
          ),
        ),
        SvgPicture.asset(
          'assets/svgs/logo.svg',
        )
      ],
    ));
  }
}
