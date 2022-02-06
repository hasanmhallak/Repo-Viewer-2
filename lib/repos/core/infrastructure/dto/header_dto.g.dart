// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HeaderDTO _$$_HeaderDTOFromJson(Map<String, dynamic> json) => _$_HeaderDTO(
      url: json['url'] as String,
      etag: json['etag'] as String? ?? '',
      nextPage: json['nextPage'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HeaderDTOToJson(_$_HeaderDTO instance) =>
    <String, dynamic>{
      'url': instance.url,
      'etag': instance.etag,
      'nextPage': instance.nextPage,
    };
