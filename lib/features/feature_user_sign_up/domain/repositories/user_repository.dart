import 'package:dartz/dartz.dart';
import 'package:rapidor_task/core/errors/failures.dart';
import 'package:rapidor_task/core/use_cases/use_case.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> signUpUserWithNameAndNumber(
      SignUpWitNameAndPhoneParams params);
}
