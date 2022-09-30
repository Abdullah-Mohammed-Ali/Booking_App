import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/profile/domain/entities/pass.dart';
import 'package:booking_app/features/profile/domain/entities/pass_change.dart';
import 'package:booking_app/features/profile/domain/reposatories/profiles_info_repository.dart';
import 'package:dartz/dartz.dart';


class GetPass_change{

  final ProfileRepositoryDomain profileRepository;

  GetPass_change(this.profileRepository);

  Future<Either<Failure , PassChange>>  call(Pass pass) async{

    return await profileRepository.passChange(pass);

  }




}