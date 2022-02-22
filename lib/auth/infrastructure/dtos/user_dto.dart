// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/auth/domain/entities/user.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();
  const factory UserDTO({
    required String username,
    required String name,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    required int followers,
    required int following,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromDomain(User _) {
    return UserDTO(
      username: _.username,
      name: _.name,
      avatarUrl: _.avatarUrl,
      followers: _.followers,
      following: _.following,
    );
  }
}
