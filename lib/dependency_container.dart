import 'package:booking_app/core/network/api_constants.dart';
import 'package:booking_app/fathi_test/fathi_bloc.dart';
import 'package:booking_app/features/auth/data_layer/local_service/shared_pref_helper.dart';
import 'package:booking_app/features/auth/data_layer/remote_service/auth_data_source.dart';
import 'package:booking_app/features/auth/data_layer/repo_implementaion/auth_repo_implementation.dart';
import 'package:booking_app/features/auth/domain_layer/repo/auth_contract_repo.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/login_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/register_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/shared_pref_use_cases/shared_pref_get_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/shared_pref_use_cases/shared_pref_post_use_case.dart';
import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:booking_app/features/booking/data/datasources/booking_web_services.dart';

import 'package:booking_app/features/booking/data/repositiers/booking_reposatories_imp.dart';
import 'package:booking_app/features/booking/domain/reposatories/booking_repository.dart';
import 'package:booking_app/features/booking/domain/usecases/create_booking.dart';
import 'package:booking_app/features/booking/domain/usecases/get_bookings.dart';
import 'package:booking_app/features/booking/domain/usecases/update_booking_status.dart';
import 'package:booking_app/features/booking/persentation/bloc/booking_bloc.dart';
import 'package:booking_app/features/explore/data/datasources/hotels_web_services.dart';
import 'package:booking_app/features/explore/data/repositiers/hotels_reposatories_imp.dart';
import 'package:booking_app/features/explore/domain/reposatories/hotels_repository.dart';
import 'package:booking_app/features/explore/domain/usecases/get_bookings.dart';
import 'package:booking_app/features/explore/persentation/bloc/hotels_bloc.dart';
import 'package:booking_app/features/home_nav/data_layer/datasource/remote_data_source/filter/remote_data_source.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/base_filter_repository.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/filter_repository.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_facilities_usecase.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/profile/data/repository/profile_info_repository.dart';
import 'features/profile/data/web_service/profile_info_web_services.dart';
import 'features/profile/domain/reposatories/profiles_info_repository.dart';
import 'features/profile/domain/usecases/getProfile_Info.dart';
import 'features/profile/domain/usecases/pass_change.dart';
import 'features/profile/domain/usecases/update_info.dart';
import 'features/profile/persentation/bloc/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // blocs
  sl.registerFactory(() => AuthCubit(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => FathiBloc(sl(), sl()));

  sl.registerFactory(() => ProfileBloc(
      getPass_change: sl(), getProfileInfo: sl(), getupdate_info: sl()));

  sl.registerFactory(() =>
      BookingBloc(booking: sl(), bookingStatus: sl(), bookingStatus2: sl()));

  sl.registerFactory(() => HotelsBloc(hotels: sl()));

  //USE CASES
  sl.registerLazySingleton(() => GetFacilitiesUseCase(sl()));
  sl.registerLazySingleton(() => GetSearchHotelsUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => SharedPrefPostUseCase(sl()));
  sl.registerLazySingleton(() => SharedPrefGetUseCase(sl()));

  sl.registerLazySingleton(() => GetProfileInfo(sl()));
  sl.registerLazySingleton(() => GetPass_change(sl()));
  sl.registerLazySingleton(() => Getupdate_info(sl()));

  sl.registerLazySingleton(() => GetBookingUsecase(sl()));
  sl.registerLazySingleton(() => CreateBookingUsecase(sl()));
  sl.registerLazySingleton(() => UpdateBookingUsecase(sl()));

  sl.registerLazySingleton(() => GetHotelsUsecase(sl()));

  // REPOSITORY
  sl.registerLazySingleton<BaseFilterRepository>(() => FilterRepository(sl()));
  sl.registerLazySingleton<AuthContractRepo>(
      () => AuthRepoImplementation(sl()));

  sl.registerLazySingleton<ProfileRepositoryDomain>(() => ProfileRepository(
        networkInfo: sl(),
        profileWebService: sl(),
      ));

  sl.registerLazySingleton<BookingRepositoryDomain>(() => BookingRepository(
        networkInfo: sl(),
        bookingWebService: sl(),
      ));

  sl.registerLazySingleton<HotelsRepositoryDomain>(() => HotelsRepository(
        networkInfo: sl(),
        hotelWebService: sl(),
      ));

// Dio
  Dio _dio = Dio();
  _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 3000,
      connectTimeout: 4000);

  // shared prefrences
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();

  // DATA SOURCE
  sl.registerLazySingleton<BaseFilterRemoteDataSource>(
      () => FilterRemoteDataSource());
  sl.registerLazySingleton(() => AuthDataSource(_dio));

  sl.registerLazySingleton(() => SharedPrefHelper(_sharedPreferences));

  sl.registerLazySingleton<ProfileWebService>(() => ProfileWebService());
  sl.registerLazySingleton<BookingWebService>(() => BookingWebService());

  sl.registerLazySingleton<HotelsWebService>(() => HotelsWebService());

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

//! External

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
