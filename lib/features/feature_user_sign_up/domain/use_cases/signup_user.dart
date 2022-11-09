import 'package:dartz/dartz.dart';
import 'package:rapidor_task/core/errors/failures.dart';
import 'package:rapidor_task/core/use_cases/use_case.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/entities/user_entity.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/repositories/user_repository.dart';

class SignUpUser {
  final UserRepository _userRepository;

  SignUpUser(this._userRepository);

  Future<Either<Failure, UserEntity>> call(
      SignUpWitNameAndPhoneParams params) async {
    final response = await _userRepository.signUpUserWithNameAndNumber(params);
    return response;
  }
}
