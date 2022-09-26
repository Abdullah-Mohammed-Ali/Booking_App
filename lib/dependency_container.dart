import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => AuthCubit());
}
