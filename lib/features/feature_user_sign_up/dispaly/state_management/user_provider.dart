import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rapidor_task/core/use_cases/use_case.dart';
import 'package:rapidor_task/features/feature_user_sign_up/data/data_source/remote_data_source.dart';
import 'package:rapidor_task/features/feature_user_sign_up/data/repositories/user_repository_impl.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/entities/user_entity.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/use_cases/signup_user.dart';

class UserProvider extends ChangeNotifier {
  UserEntity? userEntity;
  SignUpUser signUpUser;
  var isLoading = false;

  UserProvider({required this.signUpUser});

  void userSignUp(SignUpWitNameAndPhoneParams params) async {
    final response = await signUpUser(params);
    response.fold((newFailure) {
      isLoading = true;
      userEntity = null;
      notifyListeners();
    }, (newUserResponse) {
      isLoading = false;
      userEntity = newUserResponse;
      notifyListeners();
    });
  }
}

final userProvider =
ChangeNotifierProvider<UserProvider>((ref) {
  return UserProvider(
    signUpUser: SignUpUser(UserRepositoryImpl(RemoteDataSourceImpl(),),),
  );
});
