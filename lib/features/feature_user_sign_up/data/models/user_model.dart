import 'package:json_annotation/json_annotation.dart';
import 'package:rapidor_task/features/feature_user_sign_up/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  bool status;
  String message;

  UserModel({required this.status, required this.message})
      : super(status: status, message: message);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
