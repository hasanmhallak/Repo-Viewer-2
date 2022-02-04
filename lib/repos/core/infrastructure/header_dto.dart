// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'header_dto.freezed.dart';
part 'header_dto.g.dart';

@freezed
class HeaderDTO with _$HeaderDTO {
  const HeaderDTO._();
  const factory HeaderDTO({
    @JsonKey(defaultValue: '') required String etag,
    @JsonKey(defaultValue: 0) required int nextPage,
  }) = _HeaderDTO;
  factory HeaderDTO.fromJson(Map<String, dynamic> json) =>
      _$HeaderDTOFromJson(json);
}
