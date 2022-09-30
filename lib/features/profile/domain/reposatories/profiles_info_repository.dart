
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/profile/domain/entities/pass.dart';
import 'package:booking_app/features/profile/domain/entities/pass_change.dart';
import 'package:booking_app/features/profile/domain/entities/profile_info.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/update_info.dart';
import '../entities/update.dart';
abstract class ProfileRepositoryDomain{
  Future<Either<Failure , Profile_Info>> ProfileInfo() ;
  Future<Either<Failure , PassChange>>   passChange(Pass pass); // unit means nothing
  Future<Either<Failure , update_infoModel>>  updateInfo(Update update);






}