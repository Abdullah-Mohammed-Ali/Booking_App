import 'package:booking_app/fathi_test/fathi_bloc.dart';
import 'package:booking_app/features/home_nav/data_layer/datasource/remote_data_source/filter/remote_data_source.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/base_filter_repository.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/filter_repository.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_facilities_usecase.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';
import 'package:get_it/get_it.dart';
final fSl = GetIt.instance;
class FathiServiceLocator{
  void init(){
    //BLOC
    fSl.registerFactory(() => FathiBloc(fSl(),fSl()));

    //USE CASES
    fSl.registerLazySingleton(() => GetFacilitiesUseCase(fSl()));
    fSl.registerLazySingleton(() => GetSearchHotelsUseCase(fSl()));


    // REPOSITORY
    fSl.registerLazySingleton<BaseFilterRepository>(
            () => FilterRepository(fSl()));

    // DATA SOURCE
    fSl.registerLazySingleton<BaseFilterRemoteDataSource>(
            () => FilterRemoteDataSource());
  }
}