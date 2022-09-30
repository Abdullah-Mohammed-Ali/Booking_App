import 'package:booking_app/core/globals.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/shared_pref_use_cases/shared_pref_get_use_case.dart';
import 'package:booking_app/features/auth/presentation/const_strings.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/persentation/bloc/booking_bloc.dart';
import 'package:booking_app/features/explore/persentation/bloc/hotels_bloc.dart';
import 'package:booking_app/routing/app_routing_names.dart';

import 'dependency_container.dart' as di;

import 'package:booking_app/features/explore/persentation/pages/hotelspage.dart';
import 'package:booking_app/features/profile/persentation/pages/editProfile.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/profile/persentation/bloc/profile_bloc.dart';
import 'features/profile/persentation/pages/profilePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routing/routing_generator.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
  if (di.sl<SharedPrefGetUseCase>().call(sharedApiTokenKey) != null) {
    GlobalApiToken =
        di.sl<SharedPrefGetUseCase>().call(sharedApiTokenKey) as String;
  }
}
//kimooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    GetBooking getBooking =GetBooking(
        count: 9 ,
        upcoming: "upcomming"

    );

    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => di.sl<ProfileBloc>()..add(GetProfileInfoEvent())),
        BlocProvider(create: (_) => di.sl<BookingBloc>()..add(GetBookingEvent(getBooking: getBooking))),
        BlocProvider(create: (_) => di.sl<HotelsBloc>()..add(GetHotelsEvent())),

      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 750),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              /* dark theme settings */
            ),
            themeMode: ThemeMode.dark,



            debugShowCheckedModeBanner: false,
            title: 'Booking App',
            onGenerateRoute: AppRoute.onGenerateRoute,
            initialRoute: GlobalApiToken == ''
                ? AppRoutingNames.splash
                : AppRoutingNames.homeNavScreen,




          );
        },
      ),
    );
  }
}

//MAHMOUD FATHI COMMENT
