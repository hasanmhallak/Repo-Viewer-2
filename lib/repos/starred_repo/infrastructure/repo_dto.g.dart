// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepoDTO _$$_RepoDTOFromJson(Map<String, dynamic> json) => _$_RepoDTO(
      order: json['order'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      starCount: json['star_count'] as int,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$$_RepoDTOToJson(_$_RepoDTO instance) =>
    <String, dynamic>{
      'order': instance.order,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'star_count': instance.starCount,
      'avatar_url': instance.avatarUrl,
    };
