import 'package:booking_app/core/network/api_constants.dart';
import 'package:booking_app/features/auth/data_layer/remote_service/auth_data_source.dart';
import 'package:booking_app/features/auth/data_layer/repo_implementaion/auth_repo_implementation.dart';
import 'package:booking_app/features/auth/domain_layer/repo/auth_contract_repo.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/login_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/register_use_case.dart';
import 'package:booking_app/features/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'fathi_test/fathi_bloc.dart';
import 'features/home_nav/data_layer/datasource/remote_data_source/filter/remote_data_source.dart';
import 'features/home_nav/domain_layer/repository/filter/base_filter_repository.dart';
import 'features/home_nav/domain_layer/repository/filter/filter_repository.dart';
import 'features/home_nav/domain_layer/usecase/get_facilities_usecase.dart';
import 'features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // blocs
  sl.registerFactory(() => AuthCubit(sl(), sl()));
  sl.registerFactory(() => FathiBloc(sl(), sl()));

  //USE CASES
  sl.registerLazySingleton(() => GetFacilitiesUseCase(sl()));
  sl.registerLazySingleton(() => GetSearchHotelsUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));

  // REPOSITORY
  sl.registerLazySingleton<BaseFilterRepository>(() => FilterRepository(sl()));
  sl.registerLazySingleton<AuthContractRepo>(
      () => AuthRepoImplementation(sl()));

// Dio
  Dio _dio = Dio();
  _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 3000,
      connectTimeout: 4000);
  // DATA SOURCE
  sl.registerLazySingleton<BaseFilterRemoteDataSource>(
      () => FilterRemoteDataSource());
  sl.registerLazySingleton(() => AuthDataSource(_dio));
}
