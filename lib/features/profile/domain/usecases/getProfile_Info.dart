import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/profile/domain/entities/profile_info.dart';
import 'package:booking_app/features/profile/domain/reposatories/profiles_info_repository.dart';

import 'package:dartz/dartz.dart';


class GetProfileInfo{

  final ProfileRepositoryDomain profileRepository;

  GetProfileInfo(this.profileRepository);

  Future<Either<Failure , Profile_Info>> call() async{

    return await profileRepository.ProfileInfo();

  }




}