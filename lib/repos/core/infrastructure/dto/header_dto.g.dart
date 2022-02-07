// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HeaderDTO _$$_HeaderDTOFromJson(Map<String, dynamic> json) => _$_HeaderDTO(
      url: json['url'] == null
          ? ''
          : _stringFromJson(json['url'] as List<String>),
      etag: json['Etag'] == null
          ? ''
          : _stringFromJson(json['Etag'] as List<String>),
      nextPage: json['X-Next-Page'] == null
          ? 0
          : _nextPageFromJson(json['X-Next-Page'] as List<String>),
    );

Map<String, dynamic> _$$_HeaderDTOToJson(_$_HeaderDTO instance) =>
    <String, dynamic>{
      'url': instance.url,
      'Etag': instance.etag,
      'X-Next-Page': instance.nextPage,
    };
