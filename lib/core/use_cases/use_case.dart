import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class SignUpWitNameAndPhoneParams extends Equatable {
  String userName;
  String userMobile;

  SignUpWitNameAndPhoneParams({required this.userName, required this.userMobile});

  @override
  List<Object?> get props => [userName, userMobile];
}
