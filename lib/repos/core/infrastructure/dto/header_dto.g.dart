// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HeaderDTO _$$_HeaderDTOFromJson(Map<String, dynamic> json) => _$_HeaderDTO(
      url: json['url'] as String? ?? '',
      etag: json['Etag'] as String? ?? '',
      nextPage: json['X-Next-Page'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HeaderDTOToJson(_$_HeaderDTO instance) =>
    <String, dynamic>{
      'url': instance.url,
      'Etag': instance.etag,
      'X-Next-Page': instance.nextPage,
    };
