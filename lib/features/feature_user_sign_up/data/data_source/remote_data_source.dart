import 'package:rapidor_task/core/use_cases/use_case.dart';
import 'package:rapidor_task/features/feature_user_sign_up/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<UserModel>? signUpUserWithNameAndNumber(
      SignUpWitNameAndPhoneParams params);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<UserModel>? signUpUserWithNameAndNumber(
      SignUpWitNameAndPhoneParams params) async {
    var successJson = {"status": true, "message": "Sing up completed."};
    var failureJson = {
      "status": false,
      "message": "The number is spam number, Please enter proper number."
    };
    if (params.userMobile.endsWith("00")) {
      return UserModel.fromJson(failureJson);
    } else {
      return UserModel.fromJson(successJson);
    }
  }
}
