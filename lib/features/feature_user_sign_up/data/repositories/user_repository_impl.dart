import 'package:dartz/dartz.dart';
import 'package:rapidor_task/core/errors/failures.dart';
import 'package:rapidor_task/core/use_cases/use_case.dart';
import 'package:rapidor_task/features/feature_user_sign_up/data/data_source/remote_data_source.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/entities/user_entity.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  RemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signUpUserWithNameAndNumber(
      SignUpWitNameAndPhoneParams params) async {
    try {
      var response = await remoteDataSource.signUpUserWithNameAndNumber(params);
      return right(response!);
    } catch (e) {
      return left(ServerFailure(
          errorMessage: "There is no item available in the list"));
    }
  }
}
