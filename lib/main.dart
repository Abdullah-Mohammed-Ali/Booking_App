import 'package:booking_app/routing/app_routing_names.dart';
import 'package:booking_app/routing/routing_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/globals.dart';
import 'dependency_container.dart' as di;
import 'features/auth/domain_layer/use_cases/shared_pref_use_cases/shared_pref_get_use_case.dart';
import 'features/auth/presentation/const_strings.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 750),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Booking App',
          onGenerateRoute: AppRoute.onGenerateRoute,
          initialRoute: GlobalApiToken == ''
              ? AppRoutingNames.splash
              : AppRoutingNames.homeScreen,
        );
      },
    );
  }
}

//MAHMOUD FATHI COMMENT
