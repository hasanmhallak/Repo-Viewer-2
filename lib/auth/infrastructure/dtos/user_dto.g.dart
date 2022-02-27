// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserDTO _$$_UserDTOFromJson(Map<String, dynamic> json) => _$_UserDTO(
      username: json['username'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String,
      followers: json['followers'] as int,
      following: json['following'] as int,
    );

Map<String, dynamic> _$$_UserDTOToJson(_$_UserDTO instance) =>
    <String, dynamic>{
      'username': instance.username,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'followers': instance.followers,
      'following': instance.following,
    };
