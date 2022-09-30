import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/profile/domain/entities/update.dart';
import 'package:booking_app/features/profile/domain/entities/update_info.dart';
import 'package:booking_app/features/profile/domain/reposatories/profiles_info_repository.dart';
import 'package:dartz/dartz.dart';


class Getupdate_info{

  final ProfileRepositoryDomain profileRepository;

  Getupdate_info(this.profileRepository);

  Future<Either<Failure , update_info>> call(Update update) async{

    return await profileRepository.updateInfo(update);

  }




}