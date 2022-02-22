// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/auth/infrastructure/dtos/user_dto.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const User._();
  const factory User({
    required String username,
    required String name,
    required String avatarUrl,
    required int followers,
    required int following,
  }) = _User;

  factory User.fromDTO(UserDTO _) {
    return User(
      username: _.username,
      name: _.name,
      avatarUrl: _.avatarUrl,
      followers: _.followers,
      following: _.following,
    );
  }
}
