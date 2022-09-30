

import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/error/strings.dart';
import 'package:booking_app/features/profile/domain/entities/pass.dart';
import 'package:booking_app/features/profile/domain/entities/pass_change.dart';
import 'package:booking_app/features/profile/domain/entities/profile_info.dart';
import 'package:booking_app/features/profile/domain/entities/update.dart';
import 'package:booking_app/features/profile/domain/entities/update_info.dart';
import 'package:booking_app/features/profile/domain/usecases/getProfile_Info.dart';
import 'package:booking_app/features/profile/domain/usecases/pass_change.dart';
import 'package:booking_app/features/profile/domain/usecases/update_info.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileInfo getProfileInfo;
  final GetPass_change getPass_change;
  final Getupdate_info getupdate_info;

  ProfileBloc({


  required this.getProfileInfo,
  required this.getPass_change,
  required this.getupdate_info})
      : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetProfileInfoEvent) {
       // emit(LoadingProfileState());

        final failureOrPosts = await getProfileInfo();


        emit(_mapfailureOrPostsState1(failureOrPosts));

      }


      else if (event is PassChangeEvent) {
        emit(LoadingProfileState());

        final failureOrPosts = await getPass_change(event.pass);


        emit(_mapfailureOrPostsState2(failureOrPosts));
      }

      else if (event is UpdateEvent) {
        //emit(LoadingProfileState());

        final failureOrPosts = await getupdate_info(event.update);


        emit(_mapfailureOrPostsState3(failureOrPosts));
      }
      
      
      
      
    });
  }
}










ProfileState _mapfailureOrPostsState1(Either<Failure, Profile_Info> either) {
  return either.fold(
          (failure) => ErrorProfileState(message: _mapFailureToMessage(failure)),
          (profile_Info_object) => ProfileInfoState(profile_Info: profile_Info_object));
}

ProfileState _mapfailureOrPostsState2(Either<Failure, PassChange> either) {
  return either.fold(
          (failure) => ErrorProfileState(message: _mapFailureToMessage(failure)),
          (passChange_object) => PassChangeState(pass_Change: passChange_object));
}


ProfileState _mapfailureOrPostsState3(Either<Failure, update_info> either) {
  return either.fold(
          (failure) => ErrorProfileState(message: _mapFailureToMessage(failure)),
          (update_info_object) => UpdateInfoState(updateEvent:  update_info_object));
}


String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}