// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository.dart';
import '../../models/hotel_model.dart';
import 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final Repository repository;

  HotelsCubit({required this.repository}) : super(HotelsInitial());

  static HotelsCubit get(context) => BlocProvider.of<HotelsCubit>(context);

  List<HotelModel> hotels = [];

  void getHotels() async {
    emit(HotelsLoadingState());

    final response = await repository.getHotels(
      page: 1,
    );
    response.fold((l) {
      emit(ErrorState(exception: l));
    }, (r) {
      hotels = r.data!.data;

      emit(HotelsSuccessState());
    });
  }
}
