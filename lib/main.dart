import 'package:booking_app/routing/app_routing_names.dart';
import 'package:booking_app/routing/routing_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Booking App',
      onGenerateRoute: AppRoute.onGenerateRoute,
      initialRoute: AppRoutingNames.splash,
    );
  }
}


//MAHMOUD FATHI COMMENT
